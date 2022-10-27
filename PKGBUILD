# Maintainer: Jakub Dupak <dev@jakubdupak.com>
pkgname=qtrvsim
pkgver=0.9.4
pkgrel=1
pkgdesc="RISC-V CPU simulator for education purposes"
arch=("any")
url="https://github.com/cvut/qtrvsim"
license=('GPL-3.0-or-later ')
depends=("qt5-base")
makedepends=("cmake" "elfutils")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cvut/qtrvsim/archive/v${pkgver}.tar.gz")
sha256sums=("e9c467182548b0012908ba36c0e6415c4da22b0bf8bc2700d58b0995dd8e4c1b")

prepare() {
    export CMAKE_BUILD_PARALLEL_LEVEL=$(nproc)
    cd "$srcdir/${pkgname}-${pkgver}"
    mkdir build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}/build"
    cmake --build .
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}/build"
    DESTDIR="$pkgdir" cmake --install .
}

