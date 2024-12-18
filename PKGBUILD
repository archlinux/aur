# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scider
_pkgver=1.4.0
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
md5sums=('a97bda001a8ffbe4a5491691b675310a')
b2sums=('56c7419fc9bc38677d7b76a6c3bb80015b95901f0ecee048cf7e62911643b1bb4e8361314b923d428395ccad9c3b9c8157c4610bd5d8156fd7ccfaa68c3c1ab6')

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
