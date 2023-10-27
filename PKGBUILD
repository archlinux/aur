# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=cytoviewer
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An interactive multi-channel image viewer for R"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
sha256sums=('a82429120643e00d49ca9897b1eb3ecf477ae0c7cb0244d1a2fa828a8774676e')

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
