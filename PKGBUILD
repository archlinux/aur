# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rtkore
_pkgver=1.6.10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="'STK++' Core Library Integration to 'R' using 'Rcpp'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-inline
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7d3647bce2b7b9b7236d195c4909f28c')
b2sums=('f33f37ce81d1970f72276e0e955ebf4cd24fd8ad9f157ce0e43da64eb44080dd096a12bb4029e2878315a1db0fb4e2b1d54ceba9467b288eba94396848f0f671')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
