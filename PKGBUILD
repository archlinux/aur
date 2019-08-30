# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libopenblas
pkgver=0.3.7
pkgrel=1
pkgdesc="An optimized BLAS library based on GotoBLAS2 1.13 BSD. (Designed for can be installed side by side with Blas)"
arch=('x86_64')
url='http://www.openblas.net'
license=('BSD')
depends=('gcc-libs')
makedepends=('perl'
             'gcc-fortran'
             )
conflicts=('openblas')
provides=('openblas')
source=("OpenBLAS-v${pkgver}.tar.gz::http://github.com/xianyi/OpenBLAS/archive/v${pkgver}.tar.gz")
sha256sums=('bde136122cef3dd6efe2de1c6f65c10955bbb0cc01a520c2342f5287c28f9379')
options=('!emptydirs')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../"OpenBLAS-${pkgver}" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_INCLUDEDIR=include/openblas \
    -DBUILD_SHARED_LIBS=ON

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 "OpenBLAS-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
