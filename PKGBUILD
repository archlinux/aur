# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BatchQC
_pkgver=2.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Batch Effects Quality Control Software"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-data.table
  r-deseq2
  r-dplyr
  r-ebseq
  r-ggdendro
  r-ggnewscale
  r-ggplot2
  r-limma
  r-matrixstats
  r-pheatmap
  r-rcolorbrewer
  r-reader
  r-reshape2
  r-scran
  r-shiny
  r-summarizedexperiment
  r-sva
  r-tibble
  r-tidyr
  r-tidyverse
  r-shinythemes
  r-s4vectors
  r-shinyjs
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-bladderbatch
  r-devtools
  r-knitr
  r-lintr
  r-plotly
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d0a36d52c86f8622c51921a5684684ef')
b2sums=('382219e84814dea1b736afc2bc94b7cee7113e96b6eb051f1ce8d9d0391c5991ef5abb248cda5a8ea2269808ed3dcc07962f77023045523482370414ee11f19f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
