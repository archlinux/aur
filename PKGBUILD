# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDRutils
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A package with helper functions for processing drug response data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-bumpymatrix
  r-checkmate
  r-data.table
  r-digest
  r-drc
  r-jsonlite
  r-jsonvalidate
  r-multiassayexperiment
  r-qs2
  r-s4vectors
  r-stringr
  r-summarizedexperiment
)
checkdepends=(
  r-gdrtestdata
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
  r-rcmdcheck
  r-rmarkdown
  r-testthat
  r-yaml
  r-scales
  r-mockery
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('027bd9457b1d092be70271fbf348d03c')
b2sums=('2ac4eb86518769a3e83ef9cea0b912a98d12f60eeca5ba488d3bfab707c755dbcdd7f365c7214e4c3335ea311022d7269f7bc8298c4124cccee1192ceb7e4895')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

_check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
