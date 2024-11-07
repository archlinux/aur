# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Millian Poquet <millian.poquet@gmail.com>

pkgname=simgrid
pkgver=3.36
pkgrel=1
pkgdesc="Scientific instrument to study the behavior of large-scale distributed systems such as Grids, Clouds, HPC or P2P systems"
arch=( x86_64 i686)
url="https://simgrid.org/"
license=(LGPL-2.1-only)
source=("https://framagit.org/simgrid/simgrid/-/archive/v${pkgver}/simgrid-v${pkgver}.tar.gz")
depends=(graphviz python gcc-libs boost-libs perl libevent glibc)
makedepends=(cmake boost eigen doxygen pybind11 gcc-fortran)
sha256sums=('7ba1be1501092803b489c1c056707bd21d08096262be752902d6dd4dfccc3fb4')

build() {
  local _flags=(
    -Denable_compile_optimizations=ON
    -Denable_lto=ON
    -Denable_smpi=ON
    -Denable_documentation=ON
    #-Denable_python=OFF
  )

  cmake -B build -S "simgrid-v${pkgver}" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

#check() {
#  ctest --test-dir build --output-on-failure
#}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
