# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=tidymodels
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Easily Install and Load the 'Tidymodels' Packages"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-broom
  r-cli
  r-conflicted
  r-dials
  r-dplyr
  r-ggplot2
  r-hardhat
  r-infer
  r-modeldata
  r-parsnip
  r-purrr
  r-recipes
  r-rlang
  r-rsample
  r-rstudioapi
  r-tibble
  r-tidyr
  r-tune
  r-workflows
  r-workflowsets
  r-yardstick
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-covr
  r-glue
  r-knitr
  r-rmarkdown
  r-testthat
  r-xml2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3143d8a189234f966a6d7c34a5a5fcf2')
b2sums=('31679b79e0fb946f918357aa134a7d104140a6df9585f10ffcb15d2dc5a384877d7f92fa1672d23f5139142cca64ca1b61cef1da6a0a702345363a96c14c735b')

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
