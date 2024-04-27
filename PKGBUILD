# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDRimport
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('0390ee6a16f21624044bc509ebdbabd1')
b2sums=('79549696098d2611bbcc2fb13f31dd711a5153d9cb7270f60055ae16196e5ed101bd6006253c7f706ef65756212cfbe34a61b806e5b8b8f2b270f459d7843aad')

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
