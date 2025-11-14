# Maintainer: Charlie Waters <cawiii at me dot com>

pkgname=runelite-launcher-appimage
pkgver=2.7.6
pkgrel=1
pkgdesc='Open source Old School RuneScape client. (AppImage Launcher)'
arch=('x86_64' 'aarch64')
license=('BSD')
url='https://github.com/runelite/launcher'
_appimage="RuneLite-${pkgver}.AppImage"
source=(runelite-launcher.desktop)
source_x86_64+=("${_appimage}::${url}/releases/download/${pkgver}/RuneLite.AppImage")
source_aarch64+=("${_appimage}::${url}/releases/download/${pkgver}/RuneLite-aarch64.AppImage")
sha256sums=('SKIP')
sha256sums_x86_64=('b87ccca5cb0063dcfc04027f350fffd89b36204b4d23eb52238547e8a7810a43')
sha256sums_aarch64=('685029e4237ac676afac71435b32b6a2f66e914096980e34ec9d9ee76a2378a7')
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

