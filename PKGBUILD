# Maintainer: Riderius <riderius.help@gmail.com>

pkgname=mcmap
pkgver=3.0.2
pkgrel=1
pkgdesc="Pixel-art map visualizer for Minecraft. Maps are drawn from an isometric perspective. "
arch=('x86_64')
url="https://github.com/spoutn1k/mcmap"
license=('GPL3')
depends=('libpng' 'spdlog' 'fmt' 'qt5-tools')
makedepends=('git' 'gcc' 'make' 'cmake' 'gtest')
source=("${pkgname}::git+https://github.com/spoutn1k/mcmap.git")
sha256sums=('SKIP')

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
    install -Dm755 ${srcdir}/${pkgname}/build/bin/mcmap "${pkgdir}/usr/bin/mcmap"
    install -Dm755 ${srcdir}/${pkgname}/build/bin/mcmap-gui "${pkgdir}/usr/bin/mcmap-gui"
    install -Dm644 ${srcdir}/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
