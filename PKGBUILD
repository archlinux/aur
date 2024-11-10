# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=cytoviewer
_pkgver=1.6.0
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
md5sums=('bd28f195b0b83b1d2a8d5f44012385b7')
b2sums=('643abec6ee1e5233d775a4a2db38bf3c52af436efc222589b8128e66c62127ed0ce63ba508f35c6d513cfa8c76ed52b7e9733ddfeeeacee08f1de06c8d0af7c4')

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
