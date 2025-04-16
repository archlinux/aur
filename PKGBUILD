# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DeMAND
_pkgver=1.38.0
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
md5sums=('3beebda7d692f50a7131cf55dec8339f')
b2sums=('05845fc0da7bbaa402a4b326bbbb465b979f7afc6a825e0fa30e2cb5e98e8a220ceb0d126154f3131735b55634f33391d359d01645a067e5a88609a619b165ac')

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
