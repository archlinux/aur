# Maintainer: Charlie Waters <cawiii at me dot com>

pkgname=runelite-launcher-appimage
pkgver=2.7.5
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
sha256sums_x86_64=('a8b1886da6104264749211818ea96d78adf0d255f78b6d5a3e2205098c8d13d8')
sha256sums_aarch64=('2d704a0d346811a4866d82208a9e6ad48c90129010b0cd276dea942dd2dea528')
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

