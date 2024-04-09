# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=kpmt
_pkgver=0.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Known Population Median Test"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-matrixstats
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a7287ffe52028caad282fdb65df2bc53')
b2sums=('f15064a95a6cc324bab8836d9124eac4b07895fd07423d9ec865377e105ba268e0090cf81af5ad97dbe496bcf7e401cbaaf722ddbcbfc6843248a0240c25c127')

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
