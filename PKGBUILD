# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=STdeconvolve
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('e2fdd06f6b49bb938994b6b2711d46ed')
b2sums=('ae1cec96f32f031fbb7cfe645602152555d1b3f795519c188c9478292ace916b00e9b2036ca169077e29dbe269bd57c9b7fd662bd1bce83d314ed73e7ef3be0a')

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
