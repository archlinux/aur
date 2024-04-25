# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=radiant.data
_pkgver=1.6.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Data Menu for Radiant: Business Analytics using R and Shiny"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('AGPL-3.0-only AND CC-BY-SA-4.0')
depends=(
  r-arrow
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
  r-dbi
  r-dbplyr
  r-pkgdown
  r-rpostgres
  r-rsqlite
  r-testthat
  r-webshot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ec3fac3727cc43558103804934e60f36')
b2sums=('be550f6bebdeb5a1ec9a1660979875c110b60dd3f8941334c8b7318788e357d509b5b22b18046cdd68412e933dd63888e6b2f2d55ab75e0133f2395db9f6a4a2')

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
