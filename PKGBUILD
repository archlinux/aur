# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scider
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('d20e0e846be7368da2613650b3834957')
b2sums=('efd45ae9457c5d150f8db08928d589eed114ee88d5b78a14ed8de223e0d0da9f77b909f144b0f1cd7a7cb5fc093a3496df490d456aa630be4d6ad3a1670ab3fe')

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
