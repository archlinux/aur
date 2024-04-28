# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=cytoviewer
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('dc34f69f53490911e6f621d76db69f4c')
b2sums=('10ac690f8e7ced921f545efdd5a989e6bec0f56022b0debd68a710e7d0468a243be299ecc6dfd28cd24e89a77fa659162c299eb20ce7c091d6779167c9a93ea1')

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
