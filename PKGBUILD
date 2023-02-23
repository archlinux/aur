# Maintainer: Charlie Waters <cawiii at me dot com>

pkgname=runelite-launcher-appimage
pkgver=2.6.2
pkgrel=1
pkgdesc='Open source Old School RuneScape client. (AppImage Launcher)'
arch=('x86_64' 'aarch64')
license=('BSD')
url='https://github.com/runelite/launcher'
_appimage="RuneLite.AppImage"
source=(runelite-launcher.desktop)
source_x86_64+=("${_appimage}::${url}/releases/download/${pkgver}/RuneLite.AppImage")
source_aarch64+=("${_appimage}::${url}/releases/download/${pkgver}/RuneLite-aarch64.AppImage")
sha256sums=('SKIP')
sha256sums_x86_64+=('2bfa2ef0175fc61bf604c0a5b6dab31e38b3cc9a14f69ce6913f71c70316a992')
sha256sums_aarch64+=('650a911be9f855d5c1b53a2fbedd001bc1b598143ab820096002102db53c5d98')
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
