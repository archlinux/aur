# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=carma
pkgname=${_base}
pkgver=0.8.0
pkgrel=1
pkgdesc="Converters between Armadillo matrices (C++) and Numpy arrays using Pybind11"
arch=(any)
url="https://github.com/RUrlus/${_base}"
license=(Apache-2.0)
depends=(armadillo python-numpy)
makedepends=(cmake pybind11)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('acaa12482303e2c27df35eadbd5f6a1acf848724a7695d68c374015aa06dd907c83ee95c88c24eab450c38a5a82ec544d0802771bba63591e1e923a990422c4b')

build() {
  cmake \
    -S ${_base}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=14 \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCARMA_BUILD_EXAMPLES=OFF \
    -DCARMA_BUILD_TESTS=OFF \
    -DCARMA_INSTALL_LIB=ON \
    -Wno-dev
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${_base}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
