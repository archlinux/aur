# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=sSNAPPY
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Single Sample directioNAl Pathway Perturbation analYsis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-dplyr
  r-edger
  r-ggforce
  r-ggplot2
  r-ggraph
  r-graphite
  r-gtools
  r-igraph
  r-magrittr
  r-org.hs.eg.db
  r-pheatmap
  r-reshape2
  r-rlang
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
)
checkdepends=(
  r-cowplot
  r-testthat
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-colorspace
  r-cowplot
  r-dt
  r-htmltools
  r-knitr
  r-pander
  r-patchwork
  r-rmarkdown
  r-spelling
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ded74b19f37c22b96b9ed4bbf503ff80')
b2sums=('146c45fbd60bc122e043433d6faeeea3612d5b3beed8710f09fe93633023ef96598b9c04392bd3bfa958c8dc0ba56a03ae2c06e433b13efeff8a4e657bea10ae')

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
