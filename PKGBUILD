# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=strex
_pkgver=2.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Extra String Manipulation Functions"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-checkmate
  r-lifecycle
  r-magrittr
  r-rlang
  r-stringi
  r-stringr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-bench
  r-covr
  r-knitr
  r-purrr
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('450971e4e4adc803cc7054809303c1f3')
b2sums=('833070813881c95f7668abdb83345f8db9f4a85bc3c237b8eab9aae707b3a27facf36ee3cf0ab061dbf8d24161933a4dd97902543c5f902b14da7dc745a39fe6')

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
