# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

_python="python2"
_name="qr-tools"

pkgname="qtqr"
pkgver="1.2"
pkgrel="1"
pkgdesc="A Graphical interface QR Code generator and decoder."
url="https://launchpad.net/qr-tools"
arch=('i686' 'x86_64')
license=('GPL3')
depends=("${_python}" "${_python}-qrtools" "${_python}-pyqt4")
provides=('${pkgname}')
install="${pkgname}.install"
source=("https://launchpad.net/${_name}/trunk/${pkgver}/+download/${_name}-${pkgver}.tar.gz")
md5sums=('07bd6018e2325dd29acb5f7623b3e018')

_qtqr_desktop="[Desktop Entry]
Name=QtQR
Comment=QtQR is a Qt based software that let's you generate QR Codes easily, scan an image file for QR Codes and decode them or use your webcam to scan a printed one.
Exec=qtqr
Icon=qtqr
Terminal=false
Type=Application
Categories=Graphics"

build() {
    cd "${_name}"
    echo -e "$_qtqr_desktop" | tee "${pkgname}.desktop"
    sed -i 's/env python/env python2/' "${pkgname}.py"
}

package() {
    cd "${_name}"
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
