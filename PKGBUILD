# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ccdata
_pkgver=1.31.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data for Combination Connectivity Mapping (ccmap) Package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5307a7ad3c259c74795d9e45cc006d16')
b2sums=('b7f8f2c78c39b37d89a02ac3bf8f846ea214d1e9bb27db9f6899ca159bf30d3897e0f4132fee3a73bd6cb19cc404e1fe116685d9cec8cad8cf3b03cec021aff2')

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
