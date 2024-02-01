# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=strex
_pkgver=2.0.0
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
md5sums=('a044e493f751df4369925a5c967b8277')
b2sums=('ea59aad141f3d69b9abbbee7ffbdfabe663f07192d6bbb8c2155c11440a3aefe3082d8cc9a91d2b190b26fdfc700af1a3bbc1bab5b1614c014cb404000a3e4b6')

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
