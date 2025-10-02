# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=keras3
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="R interface to Keras"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-generics
  r-reticulate
  r-tensorflow
  r-tfruns
  r-magrittr
  r-zeallot
  r-fastmap
  r-glue
  r-cli
  r-rlang
  r-dotty
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-ggplot2
  r-testthat
  r-knitr
  r-rmarkdown
  r-callr
  r-tfdatasets
  r-withr
  r-png
  r-jsonlite
  r-purrr
  r-rstudioapi
  r-r6
  r-jpeg
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0cc5172d7ce966709db50cb408d42dbe')
b2sums=('3de2244a0f712a805e6d7d379ec135e7e32b40a0e9008536c93c7f05647fcec271d00c7bced986743622f5983718240ec5ec21e5787882c91bf85bb230af2855')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

#check() {
#  cd "$_pkgname/tests"
#  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
#}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
