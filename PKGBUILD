# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DeMAND
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="DeMAND"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LicenseRef-DeMAND')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('249d602b75dbcc5b7994cea1fb3988bb')
b2sums=('8ad43fe95240d8cb5028d60d29968fcef0c0cb749a3fe957d97507a7dbb14aa77d765792f48b02e5e4b032d4748e8d7faaf2a8e38a128373283179fa7242e5d6')

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
