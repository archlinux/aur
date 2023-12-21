# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=stringmagic
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Character String Operations and Interpolation, Magic Edition"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  r-rcpp
)
optdepends=(
  r-data.table
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fb2a47a42735f26602831e0ac3bf0997')
b2sums=('555816100b3c954a5792c13b659deb74b3567c480f15710b666217e3556ad086afcb1f8db020da406ba407a540ac74c0dcad269617553ecca91ead3c74371862')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla stringmagick_tests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
