# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=omada
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Machine learning tools for automated transcriptome clustering analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-clvalid
  r-dicer
  r-dplyr
  r-fpc
  r-genieclust
  r-ggplot2
  r-glmnet
  r-kernlab
  r-pdfcluster
  r-rcpp
  r-reshape
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c0ddb89b287d5c6efd9788f289e5710b')
b2sums=('35ae321c31c35b4afba2dedd2b465daba861cb5623f1a16fdc38aac71f2ae9cb2d213845b540db54d0439f6795fc3658ffaf3d010826fb89077513578edd4a82')

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
