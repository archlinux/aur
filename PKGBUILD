# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dolfinx
pkgdesc="Next generation FEniCS problem solving environment"
pkgver=0.4.1
pkgrel=1
arch=(any)
url="https://github.com/FEniCS/${pkgname}"
license=(LGPL3)
makedepends=(cmake)
depends=(boost xtensor xsimd python-fenics-basix python-fenics-ffcx hdf5-openmpi petsc parmetis)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b0824e48ad2ea23db7ca93af390891a09bd6a975f28501fc870dcf555d951764625b04614d4c28eeecb690bb95e9443ba6be52ae4e31ea51c5475fdd7710c56b')

build() {
  cmake \
    -S ${pkgname}-${pkgver}/cpp \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -Wno-dev
  cmake --build build-cmake --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm 644 ${pkgname}-${pkgver}/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
