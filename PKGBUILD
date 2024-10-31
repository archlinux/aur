# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CCPlotR
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('568a1409688bbdcbd8041e911f45147e')
b2sums=('7f924a651dd5d866cae8afb5ab136b5829cd48f70eaa7aae5b0759975d998cb2c401ed005a3aa43a3f320cc04b858e466efe264764a12687f6816ee738853494')

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
