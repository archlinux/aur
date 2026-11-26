# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggspavis
_pkgver=1.20.0
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
md5sums=('b5e4cf0f575b91d6da4c924c45822c8e')
b2sums=('7bf3eb5f4efaf2f797ad253abbbc653ddab234b5595fcfec78d5393e4ae44cfae6c82b8e2986ada2983828a591f176865264bb50190c151f6b2a58c9c4a8708c')

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
