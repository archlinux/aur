# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alabaster
_pkgver=1.4.0
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
md5sums=('e5db78f735319534c1aa94c0b7c49079')
b2sums=('79c6281ee36610e7ac4722928dbe4ab869dbd4fe3547d8bb846b20bf6ed68f5e17374a9185729a44298d56ee410533ed23e56f56e58a9114c8d5147cbff6adf6')

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
