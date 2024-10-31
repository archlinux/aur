# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GraphAlignment
_pkgver=1.70.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="GraphAlignment"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LicenseRef-GraphAlignment')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('810f6b4520c38556ae64726d1873620d')
b2sums=('1178d512498396ab9525d0a4ceb58258b2d9c725d041caf7523c67b4d2f0ca478d024b75329ae701ca47154684d40bd72257a552c48047fab5c6067d35cb4eee')

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
