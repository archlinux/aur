# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TypeInfo
_pkgver=1.68.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Optional Type Specification Prototype"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('BSD-2-Clause')
depends=(
  r
)
optdepends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a2c4ab8a27a1d9c5a463a18cd0e37356')
b2sums=('c90020ceaccf86d00cc4087f779042db3574e3e5ed02621fec3d727f203d99d0765821cbf3be88422794562ebdefce35cdd636d89a76f1f56022b64d7d11f28b')

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
