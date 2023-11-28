# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scider
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spatial cell-type inter-correlation by density in R"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
md5sums=('d20e0e846be7368da2613650b3834957')
sha256sums=('0b54660caa2f18fa624319f51f8971d29e067b56546f4bfd50cfb4dd5f8187e6')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
