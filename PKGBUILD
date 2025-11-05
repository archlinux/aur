# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=NetActivityData
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data required for getting the gene set scores with NetActivity package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('619492746ac0a1a116acff346b024f7c')
b2sums=('df065df71fbe79f3985b44c4e96c87484b7ba4ee18d827f2ddb306a8a74b02b2ad07a2b74d5e1de804ec25c22a6b6be1e9416ded899cba092fffce82bacf3f08')

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
