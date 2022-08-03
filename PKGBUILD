# Maintainer: Riderius <riderius.help@gmail.com>

pkgname=mcmap
pkgver=3.0.2
pkgrel=2
pkgdesc="Pixel-art map visualizer for Minecraft. Maps are drawn from an isometric perspective. "
arch=('x86_64')
url="https://github.com/spoutn1k/mcmap"
license=('GPL3')
depends=('zlib' 'libpng' 'spdlog' 'fmt' 'qt5-tools')
makedepends=('git' 'gcc' 'make' 'cmake' 'gtest')
source=("${pkgname}::git+https://github.com/spoutn1k/mcmap.git"
        "${pkgname}.desktop")
sha256sums=('SKIP'
            '67dff6174f3ef3c072560b6b2c161470d5f76a6282bf9bf6afa9d14750459714')

prepare() {
    cd "${srcdir}/${pkgname}"
    git checkout v${pkgver}
}

build() {
    cd "${srcdir}/${pkgname}"
    mkdir -p "${srcdir}/${pkgname}/build"
    cd "${srcdir}/${pkgname}/build"
    cmake ..
    make
}

package() {
    install -Dm755 "${srcdir}/${pkgname}/build/bin/mcmap" "${pkgdir}/usr/bin/mcmap"
    install -Dm755 "${srcdir}/${pkgname}/build/bin/mcmap-gui" "${pkgdir}/usr/bin/mcmap-gui"
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "${srcdir}/${pkgname}/src/graphical/icons/grass_block.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
