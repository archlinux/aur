# Maintainer: Reverier-Xu <reverier.xu@outlook.com>

pkgname=wsrx-appimage
pkgver=0.5.1
pkgrel=1
pkgdesc="WebSocket Reflector X"
arch=('x86_64')
url="https://github.com/XDSEC/WebSocketReflectorX"
license=('MIT')
options=("!strip")
_pkgoriginalname=wsrx
_pkgfile="WebSocketReflectorX-${pkgver}-linux-gnu-x86_64.AppImage"
provides=("${_pkgoriginalname}")
conflicts=("${_pkgoriginalname}-git")
# https://github.com/XDSEC/WebSocketReflectorX/releases/download/0.4.3/WebSocketReflectorX-0.4.3-linux-gnu-x86_64.AppImage
source=("https://github.com/XDSEC/WebSocketReflectorX/releases/download/${pkgver}/${_pkgfile}")
sha256sums=('2a0cdac2f1c6fe9d5bcafe78eb4ff2d9d2e010a56c1dd23edc605c77908131cc')

_installdir="/opt/${_pkgoriginalname}"

prepare() {
    cd ${srcdir}
    chmod a+x ${_pkgfile}
    ${srcdir}/${_pkgfile} --appimage-extract >/dev/null
    sed -i "s+Exec=wsrx-desktop+Exec=${_installdir}/WebSocketReflectorX.AppImage+" squashfs-root/wsrx-desktop.desktop
}

package() {
    install -Dm755 ${_pkgfile} "${pkgdir}/${_installdir}/WebSocketReflectorX.AppImage"
    install -Dm644 squashfs-root/usr/share/icons/hicolor/scalable/apps/${_pkgoriginalname}-desktop.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgoriginalname}-desktop.svg
    install -Dm644 squashfs-root/${_pkgoriginalname}-desktop.desktop ${pkgdir}/usr/share/applications/${_pkgoriginalname}-desktop.desktop
}
