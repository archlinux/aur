# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=getPass
_pkgver=0.2-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Masked User Input"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-2-Clause')
depends=(
  r-rstudioapi
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4d5b96287de26d2bf021c940965d76a3')
b2sums=('9bd8e26b1a53f501008d77b553aa7a978a8b30df5fc503904d24e12647b08f7bf9b29bc20adc5477eb616d42ae31c47a9cd51fe5a20dd72fbc674b2e4c2c99f8')

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
