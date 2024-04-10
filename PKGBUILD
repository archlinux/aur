# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mlapi
_pkgver=0.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Abstract Classes for Building 'scikit-learn' Like API"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-r6
)
optdepends=(
  r-knitr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7003dc9966bf251bc9f35dfc501ee74d')
b2sums=('54a363e1723ba793feaedfbbfc73b6c95abd6691ce0843a23f4a15fbc8baacc0360b84edd82c3ba8f99ad2adff8357848de3f1def3ae02f71b08f95952f98bb3')

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
