# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pbmcapply
_pkgver=1.5.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Tracking the Progress of Mc*pply with Progress Bar"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('23eabe886b2305e4790e3425d1f57e3c')
b2sums=('ebe9eae8fccc51add6fbe34152ca2a7179fdc4f171cb619c28399cbc7c1ed7b26b42bb7fb2aa5489b5d8c0e1ee5e0ce609ec1c9b74524c76c74df86cc38d0773')

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
