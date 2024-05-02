# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CCPlotR
_pkgver=1.2.0
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
md5sums=('6b5d02b8f9e4e121e4ce989c420fb3fd')
b2sums=('f3fae039e9a2f9c9b6f53a443ee1134be62738bd9772cfcd1218f18ad2b4b9ee0c0ebdf96dc60935219d22d91b2caa21b414da275473af39617e41b93aedc417')

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
