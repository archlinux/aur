# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=cytoviewer
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An interactive multi-channel image viewer for R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-archive
  r-colourpicker
  r-cytomapper
  r-ebimage
  r-rcolorbrewer
  r-s4vectors
  r-shiny
  r-shinycssloaders
  r-shinydashboard
  r-singlecellexperiment
  r-summarizedexperiment
  r-svglite
  r-svgpanzoom
  r-viridis
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d1b25ac4a15756ce2ae1d41d4eb75a9c')
b2sums=('f321dcbd4c6c2520d279acfa515a46feb411fe8f49e30d7b984ebb491e3a8560b92bb6f1bed9b110c494ae4f546103d00e4c6b8ecf5e937222341e0af8f25dbd')

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
