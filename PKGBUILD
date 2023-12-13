# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=STdeconvolve
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Reference-free Cell-Type Deconvolution of Multi-Cellular Spatially Resolved Transcriptomics Data"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-biocparallel
  r-clue
  r-ggplot2
  r-liger
  r-reshape2
  r-scatterpie
  r-slam
  r-topicmodels
  r-viridis
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-dplyr
  r-gplots
  r-gridextra
  r-hash
  r-knitr
  r-rcmdcheck
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2908e0d59713b2c3ef6c7bc549d0d123')
sha256sums=('172c5e0ed57d279eaebc7496e7be51af4d460aa2902495abbc5a6aee91077c9b')

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
