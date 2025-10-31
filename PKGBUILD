# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DeMAND
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="DeMAND"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LicenseRef-DeMAND')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a8857b32813eb30a59369297f2713c99')
b2sums=('36fdd9a3e9c8b05abb96ddf6cd99aa7e70a565bbc412674abe0417e7cf66a646c7906f37637f75b2d353a07d99971e14b14587be415fd056321cc74fd4a7127d')

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
