# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=spatstat.univar
_pkgver=3.2-0
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
md5sums=('dbd14eb0d58375867ec51836db1fbd67')
b2sums=('b491fe31abaa58b9608f5b52f17cecad023c6e6558a705a851453fe68bb595cbd825c8f85bc1f935372c1e2c8b59f60f3dd7925554034b1dfd1649799bf4929f')

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
