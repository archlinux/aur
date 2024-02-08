# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=naturalsort
_pkgver=0.1.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Natural Ordering"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-3-Clause')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9c705ea6e3033ed186b3d4932e2ae0c1')
b2sums=('cf24631d7a6f2bdb9b929b78af0ae2caf19eb7a8733fccea5ea5b6ced7f8391075247087602a0b89857f95915a96cb7826779fda5e8b49a812c18226ee6778b9')

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
