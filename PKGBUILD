# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alabaster
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('359d26d34b8867dd418d0d277b0228c9')
b2sums=('82fa84924cb5e2432f2a2506c8eeb45c5e2853209a880fd658d5baffa2d41a4a7e2f5724636a021ad20abb767649d1aa1dd8fdd981ae8113060a1761a50c893b')

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
