# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDRutils
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A package with helper functions for processing drug response data"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
sha256sums=('b06bd1bb0843ff8bc2137f207a1d07e30ebb477c8e9957acc912f689bf19f4f3')

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
