# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDRimport
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Package for handling the import of dose-response data"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
sha256sums=('469a7e74c8478d9f5d7a79ca0365f3554d9a784d09b4e6ca73e3a9c10cb29ed3')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
