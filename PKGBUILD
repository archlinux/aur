# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RMTstat
_pkgver=0.3.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Distributions, Statistics and Tests Derived from Random Matrix Theory"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-3-Clause')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bcb13cef26a31927abf5e37f998a2d46')
b2sums=('c783757b26bcb0568d69385ccff60ef38c80ae51096e79078bbdf43c4914fa023c990c6d28ad480585c234a8943afdca166b7e5112ad7e6e78c7e2de9a8d5d85')

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
