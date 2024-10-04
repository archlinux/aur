# Maintainer: Jakub Dupak <dev@jakubdupak.com>
pkgname=qtrvsim
pkgver=0.9.8
pkgrel=1
pkgdesc="RISC-V CPU simulator for education purposes"
arch=("any")
url="https://github.com/cvut/qtrvsim"
license=('GPL-3.0-or-later ')
depends=("qt5-base")
makedepends=("cmake" "elfutils")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cvut/qtrvsim/archive/v${pkgver}.tar.gz")
sha256sums=('bf7999ea953ebdad283a8415614a36a11c05043431f516d2dd3e53e5471cd329')

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

