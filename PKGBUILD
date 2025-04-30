# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDRcore
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Processing functions and interface to process and analyze drug dose-response data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-bumpymatrix
  r-checkmate
  r-data.table
  r-futile.logger
  r-gdrutils
  r-multiassayexperiment
  r-purrr
  r-s4vectors
  r-stringr
  r-summarizedexperiment
)
checkdepends=(
  r-gdrimport
  r-gdrtestdata
  r-qs
  r-testthat
)
optdepends=(
  r-biocstyle
  r-gdrimport
  r-gdrstyle
  r-gdrtestdata
  r-iranges
  r-knitr
  r-pkgbuild
  r-qs
  r-testthat
  r-yaml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fb3a8febc1443b5510341e752ebac111')
b2sums=('a90ac82f4dcb2e0c63ca73606c941f48303e6f48675dbbeb4929c5d84fb74a445c31f109ab9e37917fefa86cb941909864069ac93a74e4f994bbf82687eaff84')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
