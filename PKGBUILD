# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libopenblas
pkgver=0.3.0
pkgrel=2
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
sha256sums=('cf51543709abe364d8ecfb5c09a2b533d2b725ea1a66f203509b21a8e9d8f1a1')
options=('!emptydirs')

# prepare() {
#   mkdir -p build
# 
#   cd build
#   cmake ../"OpenBLAS-${pkgver}" \
#     -DCMAKE_BUILD_TYPE=None \
#     -DCMAKE_INSTALL_PREFIX=/usr \
#     -DCMAKE_INSTALL_LIBDIR=lib \
#     -DCMAKE_INSTALL_INCLUDEDIR=include/openblas
# 
# }

build() {
  cd "OpenBLAS-${pkgver}"

  make \
    libs \
    netlib \
    shared

#   make -C build

}

package() {
  cd "OpenBLAS-${pkgver}"

  make \
    PREFIX=/usr \
    OPENBLAS_INCLUDE_DIR="\$(PREFIX)/include/openblas" \
    DESTDIR="${pkgdir}" \
    install

#   make -C build DESTDIR="${pkgdir}" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
#   install -Dm644 "OpenBLAS-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
