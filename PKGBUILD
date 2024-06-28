# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=spatstat.univar
_pkgver=3.0-0
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
md5sums=('d9d20c33ab5ddec467cb2658182e1c66')
b2sums=('de020251265ae750b7b7ca1a10293fda352b55f4b943649a56e3d88eca5074ffcb0121d46932716f8ff71afd0ab55e8f40668efd15d8a613c227128ce2dad992')

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
