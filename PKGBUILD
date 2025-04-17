# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CCPlotR
_pkgver=1.6.0
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
md5sums=('9e8cf15d599c25a97e1e84abfeec0858')
b2sums=('54663de86c79d8ef08d52fad6e0c3ec984e7378741a5c5594df0f748bd1751ef225fa1efc2f0c42760749c0399ce8b5b4d0c6d7e9382c196955cef1620ffbb34')

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
