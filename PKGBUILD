# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bootstrap
_pkgver=2019.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=8
pkgdesc="Functions for the Book \"An Introduction to the Bootstrap\""
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-3-Clause')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d794b81b1e07ef2f214e58c7b4c0ba4f')
b2sums=('03b7b830497b0aecf42098027e283a604e1cacd0695d908eb56f84ef879ecd68086e2d8a7f0809622bc1c27600121f5ce736384a156676b459db0398f3771db7')

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
