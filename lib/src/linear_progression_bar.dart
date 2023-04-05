import 'package:flutter/material.dart';

class LinearProgressiveBarPainter extends CustomPainter {
  final double thickness;
  final double value;
  final Color foregroundColor;
  final Color backgroundColor;
  LinearProgressiveBarPainter({
    this.thickness = 10,
    this.value = .4,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.grey,
  });
  @override
  void paint(Canvas canvas, Size size) {
    var strokeWidth = thickness;
    var factor = 0.6;
    var f = (1 - factor) / 2;
    var height = size.height;
    var width = size.width;
    var foregroundStrokeEnd = (width - ((f * strokeWidth) / 2)) * value;
    var backgroundStart = Offset(0, height / 2);
    var backgroundEnd = Offset(width, height / 2);
    var foregroundStart = Offset((f * strokeWidth) / 2, height / 2);
    var foregroundEnd = Offset(foregroundStrokeEnd, height / 2);

    var backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    var foregroundPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = factor * strokeWidth
      ..color = foregroundColor;

    canvas.drawLine(backgroundStart, backgroundEnd, backgroundPaint);

    canvas.drawLine(foregroundStart, foregroundEnd, foregroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
