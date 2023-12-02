# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rtkore
_pkgver=1.6.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="'STK++' Core Library Integration to 'R' using 'Rcpp'"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-inline
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7f450400e7fcb21f3d88065d2d23d4af')
sha256sums=('5b927c31aacf9ac2bf94caf35a8c685ec910d38e3d34bcc33e23fc39ab12776c')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
