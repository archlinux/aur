# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=multiWGCNA
_pkgver=1.6.0
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
md5sums=('f2a47e58aa84aaa6db3c0b62251443bc')
b2sums=('bf6e49a58b118242ba96164c102ab8c36a0acfb9db19dcf8165b81a45974141d654a92a07eaf5f7bae19a59219d4c717125d85bebfda845a35a4ef935c70312e')

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
