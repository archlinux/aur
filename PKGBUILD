# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ore
_pkgver=1.7.5.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R Interface to the Onigmo Regular Expression Library"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-3-Clause')
depends=(
  r
)
optdepends=(
  r-covr
  r-crayon
  r-rex
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4c8634c849a71076543c387429174bc0')
b2sums=('2e037b7f1200f54938245b825975007b5fc3b24909142c0caf8d8c58fca22b48fd929ab57dd1b92fda1075bac2b79a73947eefbd0627befd28e9e93438ee310e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENCE" "$pkgdir/usr/share/licenses/$pkgname"
}
