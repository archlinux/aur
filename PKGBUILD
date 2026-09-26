# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=secretbase
_pkgver=1.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Cryptographic Hash Functions and Data Encoding"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0cb59852ea54b9d99e85fd04708a7364')
b2sums=('12b555a46aa426aae87db5a3ca6e1951e6265083c500318a90df2d3914a885a939b67229bdc1725b370bda765d0d50fb3c78ae2730508b7674251b645cff81a4')

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
