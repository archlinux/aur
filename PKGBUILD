# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=CalcMySky
pkgname=${_base,,}
pkgver=0.2.0
pkgrel=1
pkgdesc="Simulator of light scattering by planetary atmospheres"
arch=(x86_64)
url="https://github.com/10110111/${_base}"
license=(GPL)
depends=('eigen' 'glm' 'qt6-base')
makedepends=('cmake' 'ninja')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('8e56bdc844c9e469cff1b587e5037a462b8101f3c4a9ddeeb938c3b9b3d652075dedf5f691ae968204970c621828a77d5237f87a671ba1027cc8beb25da86fe7')

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
