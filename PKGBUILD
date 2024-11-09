# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=multiWGCNA
_pkgver=1.4.0
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
md5sums=('64ba3fa001a82baae932cb76dc19a515')
b2sums=('92fda82c197d85fa081c50a3675f260a3dc352b82983418ae67951f60876af4bc3aeee6cead9f93ac22ad9709abb7f6290fde0577c4cfd256ec880225af7da3f')

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
