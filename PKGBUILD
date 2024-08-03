# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SPIAT
_pkgver=1.6.2
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
md5sums=('3b65e884ef0e3692a1d62f908b2f3a67')
b2sums=('461d1662e868281bcb555305d77a28420735a699894ac93a0955e55e85a9f7b4916ff04c448bee77667957898e6d692cd37cb386d5f9b9103bc90e692fcefb44')

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
