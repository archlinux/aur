# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=sSNAPPY
_pkgver=1.10.0
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
md5sums=('19c4be1cf2891d0fe3497ebb4bfcbf2f')
b2sums=('dff93ead85889f304cc3b6ff278938e6aa4b3cafcdee9ece8d185a9c489566aaae7df9ac3a4afac0bef33df9e7cd057899dc649c800ca3b61de8b48818f06058')

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
