# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=omada
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Machine learning tools for automated transcriptome clustering analysis"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
sha256sums=('dd15848708994f18842116b7ffaa47d0be82f7419f3775081183938aa6ce665a')

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
