# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TENxVisiumData
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Visium spatial gene expression data by 10X Genomics"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-experimenthub
  r-spatialexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2d10e8e8b4d27569ad374288b61ba869')
b2sums=('5ff80453441ac92059bb1e805061ace3d008bf029c8b4641c8bbb0132f310c4460c14904d261974c6d19a6f6397b462a1f3453bf17ba9e4b4a116c12c6328d04')

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
