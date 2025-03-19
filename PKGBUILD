# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDRtestData
_pkgver=1.4.1
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
md5sums=('95bdecf8469b67b730e7149471d3df2d')
b2sums=('542d3de3b423e159cfd73153966794cffba3a1be291d887bf27b78b76ddfea38b1cd571044d362640f3ea6c3c5eb53b3bb85296470f9cf5efe7692839bc79ab3')

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
