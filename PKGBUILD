# Maintainer: Hu Butui <hot123tea123@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=collections
_pkgver=0.3.11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="High Performance Container Data Types"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5c5667506e4ec830424eebe13139e249')
b2sums=('1d27bdb8f9d8b773f8b000877f13653fa6e989cadcfa96428bff545912427d50d8274951ab5bbff5a8afe1d454252f3bb0f5e1c1a903825b5b092a0880d98be8')

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
