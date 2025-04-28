# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scider
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spatial cell-type inter-correlation by density in R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-ggplot2
  r-igraph
  r-isoband
  r-janitor
  r-knitr
  r-lwgeom
  r-pheatmap
  r-plotly
  r-rlang
  r-s4vectors
  r-sf
  r-shiny
  r-spatialexperiment
  r-spatstat.explore
  r-spatstat.geom
  r-summarizedexperiment
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
md5sums=('dd1612c00ad1208e07d1f52c3e8e456f')
b2sums=('bec6a35dd1a1680ff6135ac5f06a3876b627bb6891342ed417b7e0ac75c35201873ab59497538110022a27c92933e6fdd7b353b00cc510c34256277355ef6665')

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
