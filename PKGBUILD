# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ccdata
_pkgver=1.37.0
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
md5sums=('f990e7085ffba5c1bc890c960f182314')
b2sums=('0d63391d8e2e73a4f599d5aaeab2300d7780aec49b71698e585ac936bd01f48e2d06bf64ff9c1991cde0b2f64d2ba4b3a319dd601608454b5652a50155094072')

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
