# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CCPlotR
_pkgver=1.10.0
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
md5sums=('ab48914aae7e41ed79fafe93a5ae9e0c')
b2sums=('24936e0d768820e1cefafaf72b351ca291c854c647f9ee15a8e0988ae9cc87c17e184a6e6c51bef701c645c3302e8a1f4f5399cb931bb842bac4c4db9f15a9e9')

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
