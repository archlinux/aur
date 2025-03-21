# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alabaster
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Umbrella for the Alabaster Framework"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-alabaster.base
  r-alabaster.bumpy
  r-alabaster.mae
  r-alabaster.matrix
  r-alabaster.ranges
  r-alabaster.sce
  r-alabaster.se
  r-alabaster.spatial
  r-alabaster.string
  r-alabaster.vcf
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dcb396e0287261019fe05475bdb03c70')
b2sums=('80fa5c4797702b728b2b7c6efe4e0be409311cc091699b91566ece2f0f773df8684d55c889e357429ca8f099a6e4349cb7fe6214a021a6350c307af39de2cc56')

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
