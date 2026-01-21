# Maintainer: Hu Butui <hot123tea123@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=collections
_pkgver=0.3.10
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
md5sums=('e100eb5125489a657be3e6ee56339dad')
b2sums=('246f284bb1fd756371aafbbba9e9e66968b48fcf878f530855323853715b53e6b30f87ecae068d351c57c9bf1c63491a7223382af31ed0bfbe4da9451b0e5835')

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
