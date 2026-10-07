# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=intgemm
pkgver=0.0.3
pkgrel=2
pkgdesc="Integer Matrix Multiplication library (kroketio fork, dependency of marian-lite)"
arch=('x86_64')
url="https://github.com/kroketio/intgemm"
license=('MIT')
makedepends=('cmake' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kroketio/intgemm/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0d1b0cd471642c8e0c9160aa5ec3d1be0435d65c2f30f0df2b6651d62bb9d428')

build() {
    cd "${srcdir}/intgemm-${pkgver}"
    mkdir -p build && cd build
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/intgemm-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
    install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
