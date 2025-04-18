# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=KOdata
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="LINCS Knock-Out Data Package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('26cd461cc628ade643b0c28ab2362d85')
b2sums=('df5461523604abed44855cc59b4bf149643b08596766717a4e3cadd36b88c78f268853d6925ea4b4baf6cadb27daad33cf12b569ce93e5ce98ecf69c4d692cc5')

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
