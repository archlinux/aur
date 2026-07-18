# Maintainer: Abhiram Shibu <abhiramshibu1998@gmail.com>

pkgname=aocl-dlp
pkgver=5.3
pkgrel=1
pkgdesc="AMD Optimizing CPU Libraries - Deep Learning Primitives"
arch=('x86_64')
url="https://github.com/amd/aocl-dlp"
license=('BSD-3-Clause')
options=('staticlibs')
depends=('gcc-libs')
makedepends=('cmake' 'ninja' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('103607ba75a84f623d8ad1a2164ea100a0ce925f75c9dfdb65933cf3982ecb29')

build() {
    cmake -S "${pkgname}-${pkgver}" -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DDLP_THREADING_MODEL=openmp \
        -DBUILD_BENCHMARKS=OFF \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_TESTING=OFF \
        -G Ninja
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
