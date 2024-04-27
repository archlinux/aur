# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDRutils
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="A package with helper functions for processing drug response data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-bumpymatrix
  r-checkmate
  r-data.table
  r-drc
  r-jsonlite
  r-jsonvalidate
  r-magrittr
  r-multiassayexperiment
  r-s4vectors
  r-stringr
  r-summarizedexperiment
)
checkdepends=(
  r-gdrtestdata
  r-qs
  r-testthat
  r-yaml
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-futile.logger
  r-gdrstyle
  r-gdrtestdata
  r-iranges
  r-knitr
  r-lintr
  r-purrr
  r-qs
  r-rcmdcheck
  r-rmarkdown
  r-testthat
  r-yaml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fdf71802bbd5967b163447eda2fe37ef')
b2sums=('82bcfc3290cd4484615cf8378f8059d1900cbd1cd68687b9dfe6ef5e7fd525673435487ee6a643fcff7fe5c16c5ce94aa29abe08a47503ca5279fd3466d546cc')

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
