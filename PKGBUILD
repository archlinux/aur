# Maintainer: zer0def <zer0def@github>
# Contributor: ValHue <vhuelamo at gmail dot com>
_ubuntur="0~39~ubuntu20.04.1"
pkgbase=python-qrtools
pkgname=(
  python-qrtools
  qtqr3
)
pkgver="2.0"
pkgrel="1"
url="https://launchpad.net/qr-tools"
arch=('i686' 'x86_64')
license=('GPL3')
source=(
  "https://launchpad.net/~qr-tools-developers/+archive/ubuntu/daily/+sourcefiles/python3-qrtools/${pkgver}-${_ubuntur}/python3-qrtools_${pkgver}-${_ubuntur}.tar.gz"
  "https://launchpad.net/~qr-tools-developers/+archive/ubuntu/daily/+sourcefiles/qtqr/${pkgver}-${_ubuntur}/qtqr_${pkgver}-${_ubuntur}.tar.gz"
)
sha256sums=(
  '25f500a6c78929cd048a8c5c39d84ef2592f4419029e8499937af69ed27337fc'
  'dfb531e90a65749c7a43cc714d47c120d81a8e3149639d0d2c4f25000c8b77ec'
)

package_python-qrtools() {
  pkgdesc="A high level library for reading and generating QR codes."
  depends=("python" "python-pillow" "python-zbar" 'qrencode')

  cd "python3-qrtools-${pkgver}"
  install -d ${pkgdir}/usr/lib/python3.8/site-packages
  install -m 644 qrtools.py ${pkgdir}/usr/lib/python3.8/site-packages
}

package_qtqr3(){
  provides=(qtqr)
  pkgdesc="A Graphical interface QR Code generator and decoder."
  depends=("python" "python-qrtools" "python-pyqt5")

  cat <<EOF >"${srcdir}/qtqr.desktop"
[Desktop Entry]
Name=QtQR
Comment=QtQR is a Qt based software that let's you generate QR Codes easily, scan an image file for QR Codes and decode them or use your webcam to scan a printed one.
Exec=qtqr
Icon=qtqr
Terminal=false
Type=Application
Categories=Graphics
EOF

  cd "qtqr-${pkgver}"
  install -Dm755 qtqr.py "${pkgdir}/usr/bin/qtqr"
  install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/samples" samples/*
  install -Dm644 "${srcdir}/qtqr.desktop" "${pkgdir}/usr/share/applications/qtqr.desktop"
  install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/qtqr.png"
  install -Dm644 -t "${pkgdir}/usr/share/qt4/translations" *.qm
  install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=4 sw=2 ft=sh et:
