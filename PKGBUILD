# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=spatstat.univar
_pkgver=3.1-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="One-Dimensional Probability Distribution Support for the 'spatstat' Family"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-spatstat.utils
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e05e688d52ea5c06c2ca3bf33da1c381')
b2sums=('8f13dcfacad9b8197e732296d10d674a0f7e00e68bd3c78673fd343b8ccf75bd8b2946722b704aa59fd77e8063e2ca35499d3d219ef8d3de1c6596837b9edbf6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" SPATSTAT_TEST=y Rscript --vanilla all.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
