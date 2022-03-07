# Maintainer: Jakub Dupak <dev@jakubdupak.com>
_pkgname=qtrvsim
pkgname="${_pkgname}-git"
pkgver=r873.c708880
pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="RISC-V CPU simulator for education purposes"
arch=("any")
url="https://github.com/cvut/qtrvsim"
license=('GPL-3.0-or-later ')
depends=("qt5-base")
makedepends=("cmake" "elfutils")
provides=("qtrvsim")
conflicts=("qtrvsim")
source=("git+https://github.com/cvut/${_pkgname}.git")
sha256sums=("SKIP")

prepare() {
    export CMAKE_BUILD_PARALLEL_LEVEL=$(nproc)
    cd "${srcdir}/${_pkgname}"
    mkdir build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
    cd "${srcdir}/${_pkgname}/build"
    cmake --build .
}

package() {
    cd "${srcdir}/${_pkgname}/build"
    DESTDIR="$pkgdir" cmake --install .
}

