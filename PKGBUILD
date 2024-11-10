# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SPIAT
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spatial Image Analysis of Tissues"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-apcluster
  r-dbscan
  r-dittoseq
  r-dplyr
  r-ggplot2
  r-gridextra
  r-gtools
  r-mmand
  r-pracma
  r-rann
  r-raster
  r-reshape2
  r-rlang
  r-sp
  r-spatialexperiment
  r-spatstat.explore
  r-spatstat.geom
  r-summarizedexperiment
  r-tibble
  r-vroom
)
checkdepends=(
  r-alphahull
  r-complexheatmap
  r-elsa
  r-plotly
  r-rtsne
  r-testthat
)
optdepends=(
  r-alphahull
  r-biocstyle
  r-complexheatmap
  r-elsa
  r-knitr
  r-pkgdown
  r-plotly
  r-rmarkdown
  r-rtsne
  r-testthat
  r-umap
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3ab0f28822c6e3562763db99043222eb')
b2sums=('eb404da9d90170d39afdc397eab2f9698ac90a3b9190e8f359f3b299fc666986ca1cf43bb2a6f785972536216549d15bdd4d2db6b1195bdfb8ba22e7b79a67b1')

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
