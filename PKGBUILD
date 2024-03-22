# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SPIAT
_pkgver=1.4.2
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
md5sums=('cdd75c21f47e1cfe43a806043338ff1c')
b2sums=('e36dd728940ca18cac123a6d9c906ca2ff8d9ec45bc7c07265c3d930db629e05eff24fd860aca0de73c9a23b658f107274ea187dcc08b3c9d79cddb7697323db')

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
