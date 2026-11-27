# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDRimport
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Package for handling the import of dose-response data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-assertthat
  r-bumpymatrix
  r-checkmate
  r-data.table
  r-futile.logger
  r-gdrutils
  r-magrittr
  r-multiassayexperiment
  r-openxlsx
  r-qs2
  r-readxl
  r-rio
  r-s4vectors
  r-stringi
  r-summarizedexperiment
  r-tibble
  r-xml
  r-yaml
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-coregx
  r-gdrstyle
  r-gdrtestdata
  r-knitr
  r-pharmacogx
  r-purrr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2971d5dbf48fdf7f90beece3b1580bdd')
b2sums=('f2ce0d0ed763422149964f43e76bc8092334ed93267afa9e5310e0a7bec998e252c4f37c89941eb7b2a4c07853145855f7e1f93c3cd831ad177c670bbdc0b67e')

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
