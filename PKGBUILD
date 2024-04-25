# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=STdeconvolve
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Reference-free Cell-Type Deconvolution of Multi-Cellular Spatially Resolved Transcriptomics Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
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
b2sums=('31482b2e1bd35dbb54de4b4f1a47b18669b9a430f94851f0c469632145e1012e4beb302d5c5aa009eb34ed6c78613aa0b5bb7b893916812ec57a90f4aa731798')

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
