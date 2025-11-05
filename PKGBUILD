# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDRtestData
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R data package with testing dose response data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-checkmate
  r-data.table
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-gdrstyle
  r-knitr
  r-qs
  r-reshape2
  r-rmarkdown
  r-summarizedexperiment
  r-testthat
  r-yaml
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('39e2b20012a76dda879594d7c7bc8782')
b2sums=('37fbb6da91cd6633fc49e0a03a9eb16d93162d8567f372dc60844f18af8e7dcb1cfe5a8c63d8d31bd2bf97a66c607e7560585ba58be3ebba1065e054ace6c16e')

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
