# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scider
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spatial cell-type inter-correlation by density in R"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-arrow
  r-biocneighbors
  r-dbscan
  r-dropletutils
  r-ggplot2
  r-hexbin
  r-hexdensity
  r-igraph
  r-irlba
  r-isoband
  r-janitor
  r-knitr
  r-lwgeom
  r-pheatmap
  r-plotly
  r-rbioformats
  r-s4vectors
  r-sf
  r-shiny
  r-singlecellexperiment
  r-spatialexperiment
  r-spatialpack
  r-spatstat.explore
  r-spatstat.geom
  r-summarizedexperiment
  r-uwot
)
checkdepends=(
  r-edger
  r-testthat
)
optdepends=(
  r-edger
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1344a174d2a3edeb5a2d2d509dc0a44b')
b2sums=('493f00fef77945c7ce14a3b2e7b384ddcd33e0c02b0dfb1155bc0156aab6fe6873cb124e764574c5bd0befa5455183f09304b3b615725fff544753ab117b524c')

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
