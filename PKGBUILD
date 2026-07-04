# Maintainer: Charlie Waters <cawiii at me dot com>

pkgname=runelite-launcher-appimage
pkgver=2.7.7
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
sha256sums_x86_64=('85a0d34abef6c08561018c3600c94db113125d69318fe71fc1fe4a7ea2d49c6c')
sha256sums_aarch64=('5fbd34f76d7602e2f49ee44c5af2fe7883243c0c2b1944d6c15fcee99c954b27')
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

