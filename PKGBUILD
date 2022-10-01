# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=CalcMySky
pkgname=${_base,,}
pkgver=0.1.0
pkgrel=1
pkgdesc="Simulator of light scattering by planetary atmospheres"
arch=(x86_64)
url="https://github.com/10110111/${_base}"
license=(GPL)
depends=('eigen' 'glm' 'qt6-base')
makedepends=('cmake' 'ninja')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('53556a1d209d3fb57c1e3b0a047cd202c9f38179d7d7998ebd5dcb53adf495ccfb07cf047d0c4474f0307b5e99d542a097e0a89f37d1a2ce9cdef975a4d4073e')

build() {
  cmake \
    -S ${_base}-${pkgver} \
    -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_CXX_COMPILER=g++ \
    -DQT_VERSION=6 \
    -Wno-dev
  cmake --build build --target all
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  find "${pkgdir}" -type d -empty -delete
}
