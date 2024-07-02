# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SPIAT
_pkgver=1.6.1
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
md5sums=('ccc481f8401c2600e2173e7a37f8b538')
b2sums=('b902a3efc44b9e1b6618d41c627e403ed474ab746089ed85463aa0c5db1ac897ba699a549156fd909a251a6829353cada58ff6df894c5b8682763b5709468e3d')

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
