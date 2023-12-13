# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=sSNAPPY
_pkgver=1.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Single Sample directioNAl Pathway Perturbation analYsis"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
md5sums=('15f7a550e110c069710c3f6572a06e83')
sha256sums=('43943cb2cef095915ec8ea68818be9953f51322def8fb50a1b1c407887a62a72')

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
