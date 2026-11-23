# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDRcore
_pkgver=1.10.0
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
  r-qs2
  r-testthat
  r-yaml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('db39e269917b69f80e8d432b60c18adc')
b2sums=('a6fadaf586e74b0c2471b267e53be636af3e204986c3dba2e26173544c1a0b1203080070ffc871096f012d3be55b81e50a211e944e68e20b5dbebfc55c8d30ad')

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
