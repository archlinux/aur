# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=omada
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('d214fdb20c51cbce86bf1d34c59cb84b')
b2sums=('bc0b50c6b961a68365fd33a3dd260c580c32a01d5bab0f5b21a2f1b1c68f21223d0d21778f17559370b292ed5573dc6d263c23b38a3eedee874f57b2c5250430')

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
