# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppThread
_pkgver=2.1.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="R-Friendly Threading in C++"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-r.rsp
  r-rcpp
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('846c28d124e57d8158112db1ab59a909')
b2sums=('ebe21b7753cde88b5f36b79a9b8cc30946d3fb4cbce54a17ad0f9978080113b9f83706ce58f68d94a67bfb1a08a1178fb0a5eb617bce5fcde18604376ce56f99')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
