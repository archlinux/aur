# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=basix
pkgdesc="FEniCS finite element basis evaluation library"
pkgver=0.4.2.post1
pkgrel=1
arch=(any)
url="https://github.com/FEniCS/${pkgname}"
license=(MIT)
depends=(lapack xtensor)
makedepends=(cmake)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('a158627f5b7c1d3a25706d774957ab97a0dfb3f8f60082773cf1d50ee84443f51a8581230acb13eb967a9a9d2d09283908421845d1c7063b7f5c00afe7e3d025')

build() {
  cmake \
    -S ${pkgname}-${pkgver}/cpp \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_CXX_COMPILER=g++ \
    -DDOWNLOAD_XTENSOR_LIBS=OFF \
    -DXTENSOR_OPTIMIZE=ON \
    -Wno-dev
  cmake --build build-cmake --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm 644 ${pkgname}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
