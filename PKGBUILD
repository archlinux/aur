# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libopenblas
pkgver=0.3.6
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
sha256sums=('e64c8fe083832ffbc1459ab6c72f71d53afd3b36e8497c922a15a06b72e9002f')
options=('!emptydirs')

# prepare() {
#   mkdir -p build
# }

build() {
#   cd build
#   cmake ../"OpenBLAS-${pkgver}" \
#     -DCMAKE_BUILD_TYPE=None \
#     -DCMAKE_INSTALL_PREFIX=/usr \
#     -DCMAKE_INSTALL_LIBDIR=lib \
#     -DCMAKE_INSTALL_INCLUDEDIR=include/openblas
# 
#   make

  cd "OpenBLAS-${pkgver}"

  make \
    libs \
    netlib \
    shared


}

package() {
#   make -C build DESTDIR="${pkgdir}" install
  cd "OpenBLAS-${pkgver}"

  make \
    PREFIX=/usr \
    OPENBLAS_INCLUDE_DIR="\$(PREFIX)/include/openblas" \
    DESTDIR="${pkgdir}" \
    install

#  install -Dm644 "OpenBLAS-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
