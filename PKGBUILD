# Maintainer: Charlie Waters <cawiii at me dot com>

pkgname=openosrs-launcher-appimage
pkgver=2.2.0
pkgrel=1
pkgdesc='Open-source client for Old School RuneScape with more functionality and less restrictions. (AppImage Launcher)'
arch=('x86_64')
license=('BSD')
url='https://github.com/open-osrs/launcher'
_appimage='OpenOSRS.AppImage'
source=("https://github.com/open-osrs/launcher/releases/download/${pkgver}/${_appimage}"
        openosrs-launcher.desktop)
sha256sums=('45e7f065b21fceb3b77dc81f3e8742354a2936aead5be9ed4bc0af42d04a182e'
            'SKIP')
options=(!strip)
optdepends=('gvfs: enable links')

prepare() {
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract > /dev/null
}

package() {
    install -Dm644 \
        "${srcdir}/openosrs-launcher.desktop" \
        "${pkgdir}/usr/share/applications/openosrs-launcher.desktop"

    install -Dm644 \
        "${srcdir}/squashfs-root/openosrs.png" \
        "${pkgdir}/usr/share/pixmaps/openosrs-launcher.png"

    install -Dm755 \
        "${srcdir}/${_appimage}" \
        "${pkgdir}/usr/bin/openosrs-launcher"
}

