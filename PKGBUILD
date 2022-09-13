# Maintainer: Charlie Waters <cawiii at me dot com>

pkgname=runelite-launcher-appimage
pkgver=2.5.0
pkgrel=1
pkgdesc='Open source Old School RuneScape client. (AppImage Launcher)'
arch=('x86_64')
license=('BSD')
url='https://github.com/runelite/launcher'
_appimage="RuneLite_${pkgver}.AppImage"
source=("${_appimage}::https://github.com/runelite/launcher/releases/download/${pkgver}/RuneLite.AppImage"
        runelite-launcher.desktop)
sha256sums=('3fc64fb89f4ba1ddd4e054fef14f6c3a37e28a37493463cb3f81376e6d694d34'
            'SKIP')
options=(!strip)
optdepends=('gvfs: enable links')
conflicts=('runelite-launcher')

prepare() {
    # Remove old extracted appimage to prevent extract error
    rm -rf squashfs-root
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract > /dev/null
}

package() {
    install -Dm644 \
        "${srcdir}/runelite-launcher.desktop" \
        "${pkgdir}/usr/share/applications/runelite-launcher.desktop"

    install -Dm644 \
        "${srcdir}/squashfs-root/runelite.png" \
        "${pkgdir}/usr/share/pixmaps/runelite-launcher.png"

    install -Dm755 \
        "${srcdir}/${_appimage}" \
        "${pkgdir}/usr/bin/runelite-launcher"
}

