# Maintainer: Charlie Waters <cawiii at me dot com>

pkgname=runelite-launcher-appimage
pkgver=2.1.5
pkgrel=2
pkgdesc='Open source Old School RuneScape client. (AppImage Launcher)'
arch=('x86_64')
license=('BSD')
url='https://github.com/runelite/launcher'
_appimage="RuneLite_${pkgver}.AppImage"
source=("${_appimage}::https://github.com/runelite/launcher/releases/download/${pkgver}/RuneLite.AppImage"
        runelite-launcher.desktop)
sha256sums=('1205d26d84cfb75a4eb75fd8346a2ad78de6b6289c69afc99e51949b936d6fa8'
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

