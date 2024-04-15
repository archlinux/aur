# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ensurer
_pkgver=1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=10
pkgdesc="Ensure Values at Runtime"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-knitr
  r-magrittr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/Archive/$_pkgname/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0f3ea28ed5b5276143f126737fb116fa')
b2sums=('f7b7fa7c580bf6b2693dd42a7cf03ba2743750fc7d3217080056256ccf1f7b2e3380f7414bb7bfbb9857b9b1f5c2454a798152b3f75ff02280edaa19227aae9f')

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
