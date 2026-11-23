# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=multiWGCNA
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package for deeping mining gene co-expression networks in multi-trait expression data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-cowplot
  r-data.table
  r-dcanr
  r-dplyr
  r-flashclust
  r-ggalluvial
  r-ggplot2
  r-ggraph
  r-ggrepel
  r-igraph
  r-magrittr
  r-patchwork
  r-readr
  r-reshape2
  r-scales
  r-stringr
  r-summarizedexperiment
  r-tidyr
  r-wgcna
)
checkdepends=(
  r-experimenthub
  r-testthat
)
optdepends=(
  r-biocstyle
  r-doparallel
  r-experimenthub
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
  r-vegan
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('85fd0e78fd39cd7066537246fc6ac0ad')
b2sums=('b04f65f58448543500666d2caebf66bf37b6d02c885698fd1d70a9c958b3206b6b4eea314c6cc928b72b269e7441fb5b3068b0f159d04140bb587952d5d7f766')

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
