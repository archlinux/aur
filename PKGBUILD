# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=sSNAPPY
_pkgver=1.6.2
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
md5sums=('0ca61b239c7ba1761b973b5dbb83cb69')
b2sums=('03029c13d3333d1d58e969be4ef3f1a5e07218849af09cdc36c95d265bf24b2e3d986822d012c8c3276ca828d19a5030bfdfb28c8d740cce98a9845e6579437b')

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
