# Maintainer: Charlie Waters <cawiii at me dot com>

pkgname=runelite-launcher-appimage
pkgver=2.4.2
pkgrel=1
pkgdesc='Open source Old School RuneScape client. (AppImage Launcher)'
arch=('x86_64')
license=('BSD')
url='https://github.com/runelite/launcher'
_appimage="RuneLite_${pkgver}.AppImage"
source=("${_appimage}::https://github.com/runelite/launcher/releases/download/${pkgver}/RuneLite.AppImage"
        runelite-launcher.desktop)
sha256sums=('c3f28275db270cc0aed476e5ef5be8b42fc90218e716791b0a1805497e0819d1'
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

