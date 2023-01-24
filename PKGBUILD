# Maintainer: Charlie Waters <cawiii at me dot com>

pkgname=runelite-launcher-appimage
pkgver=2.6.1
pkgrel=1
pkgdesc='Open source Old School RuneScape client. (AppImage Launcher)'
arch=('x86_64' 'aarch64')
license=('BSD')
url='https://github.com/runelite/launcher'
_appimage="RuneLite-${CARCH}_${pkgver}.AppImage"
source=(runelite-launcher.desktop)
source_x86_64+=("${_appimage}::${url}/releases/download/${pkgver}/RuneLite.AppImage")
source_aarch64+=("${_appimage}::${url}/releases/download/${pkgver}/RuneLite-aarch64.AppImage")
sha256sums=('SKIP')
sha256sums_x86_64+=('173314f43950d4f50f56fed689989a60ec0e8a09504241b8ea7b8981dcc1bf0a')
sha256sums_aarch64+=('19ec06e232e778f784c566e08cb3495b091d161193a81db0524e4ea5c3dee983')
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

