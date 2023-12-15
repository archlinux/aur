# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=multiWGCNA
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="An R package for deeping mining gene co-expression networks in multi-trait expression data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=(GPL3)
depends=(
  r-cowplot
  r-data.table
  r-dcanr
  r-dplyr
  r-flashclust
  r-ggalluvial
  r-ggplot2
  r-ggrepel
  r-igraph
  r-patchwork
  r-readr
  r-reshape2
  r-scales
  r-stringr
  r-summarizedexperiment
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
md5sums=('b8f70e9496cf73238aa3ba3c08cb81fa')
b2sums=('bb4aae0c4c80edd3127f949ce4f974cbcb34bed48dc78143a735180256d77f8fb44a2b1ecb610b819c456757b59edc422e2397008344c18142d2bbbd3fc5ed03')

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
