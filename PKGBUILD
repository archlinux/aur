# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alabaster
_pkgver=1.12.0
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
md5sums=('60f820395c1ba7cfa364a3438790b4a4')
b2sums=('a8a9fcce8923baa0b83701680ae9a00044c0dd4918de67ad6dbb7a82708b6f9ef76f653e84f3573298b027c5fbbb5c148fc0f3f883ff221c792789318300397b')

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
