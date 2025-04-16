# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ccdata
_pkgver=1.33.0
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
md5sums=('54c720ce50df40f266f7507bc4ec653a')
b2sums=('a56f7796d7281c02687932754db3aed5fb52c465073d3d9d341bd6b45fbad1764a450a8f80e2c55a7a423c790511473e3f6bf46f35c94937880d6f0adbee3217')

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
