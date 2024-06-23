# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=bezier
pkgver=2024.6.20
pkgrel=1
pkgdesc="Library for Bezier curves and triangles"
arch=(x86_64)
url="https://github.com/dhermes/${pkgname}"
license=(Apache-2.0)
depends=(gcc-libs)
makedepends=(gcc-fortran cmake)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('add582a0e9724c1952fcb99f2727af71e54f537aeae319b1d9445089423d9d67da599303b190b944a48c155a0e21123861b0506b9aa7f458e689ae0a92c4161a')

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
