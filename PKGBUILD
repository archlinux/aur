# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggspavis
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Visualization functions for spatial transcriptomics data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-ggplot2
  r-ggrepel
  r-ggside
  r-rcolorbrewer
  r-scales
  r-singlecellexperiment
  r-spatialexperiment
  r-summarizedexperiment
)
optdepends=(
  r-arrow
  r-biocstyle
  r-bumpymatrix
  r-knitr
  r-osta.data
  r-patchwork
  r-rmarkdown
  r-scater
  r-scran
  r-stexampledata
  r-testthat
  r-uwot
  r-visiumio
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('de685f82354cfc459a20157e37f81a32')
b2sums=('a35c0a4912c4169869975ac04d2b0083cdab38119a237c574a83f5f3101a323320ac042ecb88bcf1ade8d880d8526f127988982456ed0dcbea7ed86ab4a703b6')

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
