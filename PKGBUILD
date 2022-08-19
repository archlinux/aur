# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=basix
pkgdesc="FEniCS finite element basis evaluation library"
pkgver=0.5.0
pkgrel=1
arch=(x86_64)
url="https://github.com/FEniCS/${pkgname}"
license=(MIT)
depends=(lapack xtensor)
makedepends=(cmake)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('3e3b01720765d9c3242ee63f5fa067e7c3b1cf4ea5d46c8c567ad09b672949a81407c7b1ebae410556deaa32add4b916d0a75caf9d704128ae55e32a94b04e22')

build() {
  cmake \
    -S ${pkgname}-${pkgver}/cpp \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=20 \
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
