# Maintainer: Charlie Waters <cawiii at me dot com>

pkgname=openosrs-launcher-appimage
pkgver=2.1.9.1
pkgrel=1
pkgdesc='Open-source client for Old School RuneScape with more functionality and less restrictions. (AppImage Launcher)'
arch=('x86_64')
license=('BSD')
url='https://github.com/open-osrs/launcher'
_appimage='OpenOSRS.AppImage'
source=("https://github.com/open-osrs/launcher/releases/download/${pkgver}/${_appimage}"
        openosrs-launcher.desktop)
sha256sums=('b16f5d2323194a746cff10f91a40da3b3c9f5c1ca7b039b5659c3e260afe8781'
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

