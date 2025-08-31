# Maintainer: Reverier-Xu <reverier.xu@outlook.com>

pkgname=wsrx-appimage
pkgver=0.5.11
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
sha256sums=('54fa079c7895c4137acd264ba91c5af8f4d36e17d6cd05782241d27088fd5a3b')

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
