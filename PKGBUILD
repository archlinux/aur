# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DeMAND
_pkgver=1.34.0
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
md5sums=('697c85fe868d114d67fe4d77def0dc95')
b2sums=('f68167d280a3c6f329f8c1b0b338c5ffe0d0655f23ba8af0408d0c90f0f55e234addb3dce294d554c637f4907aa8a6fb099a791555d30407ec62fa9aaac8c7d8')

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
