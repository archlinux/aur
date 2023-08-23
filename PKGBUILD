# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=bezier
pkgver=2023.7.28
pkgrel=1
pkgdesc="Library for Bezier curves and triangles"
arch=(x86_64)
url="https://github.com/dhermes/${pkgname}"
license=(Apache)
depends=(gcc-libs)
makedepends=(gcc-fortran cmake)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('beec5c3c9f903a81f02cb491a6c0abdf5d0ad8fb0b9a19a30403113b68b4eee1968c2a4ed1e1dbd4b90e9b35316865cbc6350a6799251a1b087c333117dc5492')

build() {
  cmake \
    -S ${pkgname}-${pkgver}/src/fortran \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_Fortran_COMPILER=gfortran \
    -DTARGET_NATIVE_ARCH=OFF \
    -DCMAKE_SKIP_INSTALL_RPATH=YES \
    -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm 644 ${pkgname}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}