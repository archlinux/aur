# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Pranav K Anupam <pranavanupam@yahoo.com>
# Contributor: Alex Branham <branham@utexas.edu>

_pkgname=tidyverse
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Easily Install and Load the 'Tidyverse'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-broom
  r-cli
  r-conflicted
  r-dbplyr
  r-dplyr
  r-dtplyr
  r-forcats
  r-ggplot2
  r-googledrive
  r-googlesheets4
  r-haven
  r-hms
  r-httr
  r-jsonlite
  r-lubridate
  r-magrittr
  r-modelr
  r-pillar
  r-purrr
  r-ragg
  r-readr
  r-readxl
  r-reprex
  r-rlang
  r-rstudioapi
  r-rvest
  r-stringr
  r-tibble
  r-tidyr
  r-xml2
)
checkdepends=(
  r-mockr
  r-testthat
)
optdepends=(
  r-covr
  r-feather
  r-glue
  r-knitr
  r-mockr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f5705d42feb6697e214d8b007fda2f55')
b2sums=('ec21d74b7776d4664a4353ba09457d0b9b85093f68b018dcc1cc82fc8cd5c5f2e29754611eb6a3a48cc2cc60cc9417b1f900fbf364608dcb7c169be74606b75f')

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
