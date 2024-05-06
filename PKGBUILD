# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=escheR
_pkgver=1.3.2
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
md5sums=('db0a4cc95d4270dc69ce292d88e8c006')
b2sums=('2045dd02a2b038df9c39e0a0fe8056b83c68e2ce9e579bd018de7b8c0b91a22de8961e0507acd537288318c5e0d596ece9c9a954aa8e28fd4e7ad4582b82cba5')

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
