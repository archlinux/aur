# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=escheR
_pkgver=1.4.0
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
md5sums=('c285bb9db644170a9b00e77b64b99147')
b2sums=('6f50c031c5571b6a56b3e6b2d4138ed06a6da4d505066a5d9dfaa475c7f7e66183ce96fd89529ee8ad35241afea4ec08a8fc626b41181234fe2ef9584c9f2f69')

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
