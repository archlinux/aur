# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=escheR
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Unified multi-dimensional visualizations with Gestalt principles"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-ggplot2
  r-rlang
  r-singlecellexperiment
  r-spatialexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-bumpymatrix
  r-ggpubr
  r-hexbin
  r-knitr
  r-rmarkdown
  r-scater
  r-scran
  r-scuttle
  r-seurat
  r-stexampledata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8e2e0e1605c7f2b3e7ec7af939e65b2b')
b2sums=('d6e8c90fadb5de921140ccbac7500d16219d3c8d9a4729051e9b2cf2c48fc66c1d344430f1e0e725c36316a5220043cf87d735a5521b04e36837a58dadb3ff68')

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
