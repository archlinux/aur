# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libopenblas
_pkgname=OpenBLAS
pkgver=0.2.20
pkgrel=2
pkgdesc="An optimized BLAS library based on GotoBLAS2 1.13 BSD"
arch=('x86_64')
url='http://www.openblas.net'
license=('BSD')
depends=('gcc-libs')
makedepends=('perl'
             'gcc-fortran'
             )
source=("${_pkgname}-v${pkgver}.tar.gz::http://github.com/xianyi/OpenBLAS/archive/v${pkgver}.tar.gz")
sha256sums=('5ef38b15d9c652985774869efd548b8e3e972e1e99475c673b25537ed7bcf394')
options=('!emptydirs')

build() {
  cd "${_pkgname}-${pkgver}"

  make \
    libs netlib shared

}

package() {
  cd "${_pkgname}-${pkgver}"

  make \
    PREFIX=/usr \
    OPENBLAS_INCLUDE_DIR="\$(PREFIX)/include/openblas" \
    DESTDIR="${pkgdir}" \
    install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
