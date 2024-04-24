# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ccdata
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Data for Combination Connectivity Mapping (ccmap) Package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('60cbd595e53467fd61e1edc4f8ea47e7')
b2sums=('6f9abdf4262d9174de356072882e186e9378622f54247396a75e4a4c074c083e5a668213d2710af49181bb3eff8f5e167120e358da64bd2e29bc5697c7df4ea3')

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
