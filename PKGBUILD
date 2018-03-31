# Maintainer: ValHue <vhuelamo at gmail dot com>s
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_python="python2"
_name="qr-tools"
_ubuntur="0~29~ubuntu17.10.1"
pkgname="qtqr"
pkgver="1.4"
pkgrel="2"
pkgdesc="A Graphical interface QR Code generator and decoder."
url="https://launchpad.net/qr-tools"
arch=('i686' 'x86_64')
license=('GPL3')
depends=("${_python}" "${_python}-qrtools" "${_python}-pyqt4")
provides=("${pkgname}")
source=("https://launchpad.net/~${_name}-developers/+archive/ubuntu/daily/+files/${pkgname}_${pkgver}-${_ubuntur}.tar.gz")
sha256sums=('b1d3ba45594ddacd96c2da906b8ed90a0f0f50cc0348b9d2435ff11c93eebae1')

_qtqr_desktop="[Desktop Entry]
Name=QtQR
Comment=QtQR is a Qt based software that let's you generate QR Codes easily, scan an image file for QR Codes and decode them or use your webcam to scan a printed one.
Exec=qtqr
Icon=qtqr
Terminal=false
Type=Application
Categories=Graphics"

build() {
    cd "${pkgname}-${pkgver}"
    echo -e "$_qtqr_desktop" | tee "${pkgname}.desktop"
    sed -i 's/env python/env python2/' "${pkgname}.py"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -d ${pkgdir}/usr/bin
    install -d ${pkgdir}/usr/share/${pkgname}/samples
    install -d ${pkgdir}/usr/share/applications
    install -d ${pkgdir}/usr/share/pixmaps
    install -d ${pkgdir}/usr/share/qt4/translations

    install -m 755 qtqr.py ${pkgdir}/usr/bin/qtqr
    install -m 644 samples/* ${pkgdir}/usr/share/${pkgname}/samples
    install -m 644 qtqr.desktop ${pkgdir}/usr/share/applications
    install -m 644 icon.png ${pkgdir}/usr/share/pixmaps/qtqr.png
    install -m 644 *.qm ${pkgdir}/usr/share/qt4/translations

    install -D -m644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=2 ft=sh et:
