# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=radiant.data
_pkgver=1.6.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data Menu for Radiant: Business Analytics using R and Shiny"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('AGPL-3.0-only AND CC-BY-SA-4.0')
depends=(
  r-base64enc
  r-broom
  r-bslib
  r-car
  r-curl
  r-dplyr
  r-dt
  r-ggplot2
  r-glue
  r-import
  r-jsonlite
  r-knitr
  r-lubridate
  r-magrittr
  r-markdown
  r-patchwork
  r-plotly
  r-png
  r-psych
  r-randomizr
  r-readr
  r-readxl
  r-rlang
  r-rmarkdown
  r-rstudioapi
  r-scales
  r-shiny
  r-shinyace
  r-shinyfiles
  r-stringi
  r-tibble
  r-tidyr
  r-writexl
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-arrow
  r-dbi
  r-dbplyr
  r-pkgdown
  r-rpostgres
  r-rsqlite
  r-testthat
  r-webshot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c760b4d84c01010300a4f954ac86f35d')
b2sums=('f7e401e38fbea7706a367bd21d4bf8c2c72b631c119e4f6614bda0c7f2a659252427f6456998993a3ae5f62d6df5ed0178766727c2ed27ac03a0c9775b672b27')

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
