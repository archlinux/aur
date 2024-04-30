# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=canvasXpress
_pkgver=1.46.9-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Visualization Package for CanvasXpress in R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-htmltools
  r-htmlwidgets
  r-httr
  r-jsonlite
)
checkdepends=(
  r-canvasxpress.data
  r-dplyr
  r-ggplot2
  r-readr
  r-shiny
  r-stringr
  r-testthat
)
optdepends=(
  r-canvasxpress.data
  r-dplyr
  r-dt
  r-ggplot2
  r-glue
  r-knitr
  r-limma
  r-png
  r-readr
  r-rlang
  r-rmarkdown
  r-shiny
  r-stringr
  r-testthat
  r-tibble
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f25e77795fcb5dc87488793b343c60e0')
b2sums=('ea4dedf9e4347aa6040407e2895e34f842050ce46416a5e8967d1fef459e6b5a55a10d4695fd3ebcb000980ec5503956602baa75d064e7c01de3d3f1a642a50c')

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
