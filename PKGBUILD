# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=NetActivityData
_pkgver=1.10.0
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
md5sums=('60eb4b043fa74b724c9bcfc3bff2723e')
b2sums=('c17ac97e91c2ab1d7e64e1456d3abfbc09715458b53227fe9ee50085a48e05c3050b45dc95c1ad527cbeae0ad0641e38ae6f5f00fc078a55abd0152c3a7334e9')

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
