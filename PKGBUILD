# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=spatstat.univar
_pkgver=3.0-1
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
md5sums=('97dbd0ef7b7e497e088492d25f0b1ff9')
b2sums=('e982a1dbc8830afc4f31c5c2f7ed526149621b2c8489d0b4ae46d631aa9083623d24d71ab4d349713506e39c8176e8865aa01662b92bc0012da62d114472f344')

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
