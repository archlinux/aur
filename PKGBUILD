# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BatchQC
_pkgver=2.0.0
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
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-bladderbatch
  r-dendextend
  r-devtools
  r-knitr
  r-lintr
  r-plotly
  r-rmarkdown
  r-shinythemes
  r-spelling
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('775f7f746c2ada89c20ff78bb6faa103')
b2sums=('3efff6f48d3a655cb32c4341d6cbb0a10b73560692bfaf6d2a5def765822a480a66be54d734d0c7702a4b430673e9b886e881851c7a4f7fde306917fc71f3d33')

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
