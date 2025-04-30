# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDRimport
_pkgver=1.6.0
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
  r-coregx
  r-data.table
  r-futile.logger
  r-gdrutils
  r-magrittr
  r-multiassayexperiment
  r-openxlsx
  r-pharmacogx
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
  r-qs
  r-testthat
)
optdepends=(
  r-biocstyle
  r-gdrstyle
  r-gdrtestdata
  r-knitr
  r-purrr
  r-qs
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('41d154f693ba371239b248a591d0601e')
b2sums=('a57658e04158fe8d0e97f42744cda1fe06abf0d093d695d6f2b012d24aafdbafd7c115ce6336f8a2f7649d84dd8145ac5f6e4f314a82c097d40d8ca03e1bb002')

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
