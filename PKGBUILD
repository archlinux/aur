# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SPIAT
_pkgver=1.8.1
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
md5sums=('3c8877b60acc9726bd1313abf4cc9231')
b2sums=('c3455dfbf57f9a51ee2ac7099f292f10ab73db2a7a0e555851a847e3d16f6a73d0239d8154ebcecf2d8cc3d130acd5bb8f067aff3d7c155a9875420b9b982af4')

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
