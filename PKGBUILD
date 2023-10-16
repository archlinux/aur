# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=radiant.data
_pkgver=1.6.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data Menu for Radiant: Business Analytics using R and Shiny"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(AGPL3)
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
md5sums=('0d588a51961f5ddccf0295201e7b9371')
sha256sums=('1708ebca50962720de64cfb0f648427449d023acd26fa2f4ac336d6386cf4708')

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
