# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=secretbase
_pkgver=1.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Cryptographic Hash Functions and Data Encoding"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a563588d4e0d71e2aa92b2aeec56f046')
b2sums=('a2a953390177af4c8843e18a0ab75e920a61302950b591590c5998f6f240152fe6b09f619571d709eccb76e38e4cd8976b733c78a1f0102799763e7e0b0d6404')

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
