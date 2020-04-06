# Maintainer: Charlie Waters <cawiii at me dot com>

pkgname=runelite-launcher-appimage
pkgver=2.1.0
pkgrel=2
pkgdesc='Open source Old School RuneScape client. (AppImage Launcher)'
arch=('x86_64')
license=('BSD')
url='https://github.com/runelite/launcher'
_appimage="RuneLite_${pkgver}.AppImage"
source=("${_appimage}::https://github.com/runelite/launcher/releases/download/${pkgver}/RuneLite.AppImage"
        runelite-launcher.desktop)
sha256sums=('0dcbeb4392a8106642c28e569928562e5a188038faa73646e64bb7e171f499c6'
            'SKIP')
options=(!strip)
optdepends=('gvfs: enable links')
conflicts=('runelite-launcher')

prepare() {
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

