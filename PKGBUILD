# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=strex
_pkgver=2.1.0
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
md5sums=('8e2be1c8e8cee20d62f427e75ed29fa2')
b2sums=('7599dffd9410a13c24f8a343ef24860224756212b6ade025581e64ccfad14fed6a03198f3b3d25416d08368efe750dcad5c243bc8e93b19fe7d1ac3301a99788')

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
