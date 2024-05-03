# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDRimport
_pkgver=1.2.0
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
md5sums=('92d70f4730716895a911a22b8d1999be')
b2sums=('e0158fa33ffce2c66ee2ea720743cb17986c1a70cda67bcd06118e3b8c285d72cc4a0e494cfa017807e79942f47ff8e4596eddf8406fd33ac07a28456b0a609d')

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
