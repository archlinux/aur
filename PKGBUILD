# Maintainer: ValHue <vhuelamo at gmail dot com>s
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_python="python3"
_name="qr-tools"
_ubuntur="0~39~ubuntu19.10.1"
pkgname="qtqr"
pkgver="2.0"
pkgrel="1"
pkgdesc="A Graphical interface QR Code generator and decoder."
url="https://launchpad.net/qr-tools"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('python' 'python-qrtools' 'python-pyqt5')
source=("${pkgname}-${pkgver}.tar.gz::https://launchpad.net/~${_name}-developers/+archive/ubuntu/daily/+sourcefiles/${pkgname}/${pkgver}-${_ubuntur}/${pkgname}_${pkgver}-${_ubuntur}.tar.gz")
sha256sums=('46ed22299f6c59b5eced956d95400965785ebc20a4af79d161936c3396a6336c')

_qtqr_desktop="[Desktop Entry]
Name=QtQR
Comment=QtQR is a Qt based software that let's you generate QR Codes easily, scan an image file for QR Codes and decode them or use your webcam to scan a printed one.
Exec=qtqr
Icon=qtqr
Terminal=false
Type=Application
Categories=Graphics
MimeType=image/gif;image/png;image/jpg;"

prepare() {
    cd "${pkgname}-${pkgver}"
    echo -e "$_qtqr_desktop" | tee "${pkgname}.desktop"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -D -m755 qtqr.py ${pkgdir}/usr/bin/qtqr
    install -D -m644 -t "${pkgdir}/usr/share/${pkgname}/samples" samples/*
    install -D -m644 qtqr.desktop ${pkgdir}/usr/share/applications/qtqr.desktop
    install -D -m644 icon.png ${pkgdir}/usr/share/pixmaps/qtqr.png
    install -D -m644 -t "${pkgdir}/usr/share/qt/translations" *.qm

    install -D -m644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
