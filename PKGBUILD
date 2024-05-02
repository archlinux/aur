# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TypeInfo
_pkgver=1.70.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('848c77dc3882d45e290acc9f75fa2cb3')
b2sums=('78dec40d8bf3aff79aee63f231cb555d183892593a836901c0484b1511d015ee138a9863e03b9364784a9012ccae57acf4dfea2c13e296db9875e281d3a5e369')

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
