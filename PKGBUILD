# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=spatstat.univar
_pkgver=3.1-6
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
md5sums=('c392d52a7adba61a9c333ee958faab61')
b2sums=('d30ed931ecbf521263e0c356c930f1675944105f2062043a55815c6ab73256e9f7aad702e4e2758cf6fce91d087fffd22be9269284f937b3aa33f834704e741f')

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
