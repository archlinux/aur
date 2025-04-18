# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=sSNAPPY
_pkgver=1.12.0
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
md5sums=('50c7f8b020fcb17c61df95482a90c91b')
b2sums=('44fcf41af229f4423584ff08e97ff19aaed20c37a5be40b5dbc6d2d510b3d85d0ba7bc14a2cc5c7cf7f6794fab20b478c2e9351726d0ee025bf9b4eb57267dfd')

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
