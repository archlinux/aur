# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=flowGate
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interactive Cytometry Gating in R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocmanager
  r-dplyr
  r-flowcore
  r-flowworkspace
  r-ggcyto
  r-ggplot2
  r-purrr
  r-rlang
  r-shiny
  r-tibble
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-stringr
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6bc373074c0ff734fa2b764fb9a2158c')
b2sums=('c4275109cca8511beca340a8d32538bf0f3adaef3d9b093dd90f559c77777d4ba6133b97eb954f7baf0cbd0366f206555e6322d82fd7fc8b97388498e0aacf0f')

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
