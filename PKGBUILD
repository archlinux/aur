# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CCPlotR
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Plots For Visualising Cell-Cell Interactions"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-circlize
  r-complexheatmap
  r-dplyr
  r-forcats
  r-ggbump
  r-ggh4x
  r-ggplot2
  r-ggraph
  r-ggtext
  r-igraph
  r-patchwork
  r-plyr
  r-rcolorbrewer
  r-scales
  r-scatterpie
  r-stringr
  r-tibble
  r-tidyr
  r-viridis
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('913896518f29cd88d7ac9d57298f44de')
b2sums=('13043b655315b8bf2c7771280049ea65fe1f25b04b2cc0657be4e3e4e5694ed0e369856e2d9206917f9309ae2d5611d7cbf28225570c88f0eb89c53ef6b47d91')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
