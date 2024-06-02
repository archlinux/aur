# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rtkore
_pkgver=1.6.12
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
md5sums=('08bb981c3b634277431e62935569d995')
b2sums=('4a1f145f8a3d544ca3f9a3821e2ef9f24d504b26697584651d42304de6b26c9dc9b6378b868b53ad999eabf03ea71f2b828c6f075fe145810410dd47f039365e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
