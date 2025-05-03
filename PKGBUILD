# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rtkore
_pkgver=1.6.13
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="'STK++' Core Library Integration to 'R' using 'Rcpp'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-inline
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('11236bc8f7ed0ca074c6ea4845194081')
b2sums=('3c57ed2bf83f94ba78df60e7b1fb32c1ac2a8797f33427070f05e43827b6d898c1fe716e5d0213284dc412f62acb6056d43c335c6bbe299218748b3f9ca0c3b2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
