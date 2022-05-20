# Maintainer: Charlie Waters <cawiii at me dot com>

pkgname=openosrs-launcher-appimage
pkgver=3.0.0
pkgrel=1
pkgdesc='Open-source client for Old School RuneScape with more functionality and less restrictions. (AppImage Launcher)'
arch=('x86_64')
license=('BSD')
url='https://github.com/open-osrs/launcher'
_appimage="OpenOSRS_${pkgver}.AppImage"
source=("${_appimage}::https://github.com/open-osrs/launcher/releases/download/${pkgver}/OpenOSRS.AppImage"
        openosrs-launcher.desktop)
sha256sums=('65e15fa5c226e4647ad480b6f91b6fcea32eb6bb7fa6975f23f89e77f6d39c17'
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

