# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggspavis
_pkgver=1.14.0
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
  r-biocstyle
  r-bumpymatrix
  r-knitr
  r-patchwork
  r-rmarkdown
  r-scater
  r-scran
  r-stexampledata
  r-testthat
  r-uwot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e4aa92332590482aa939517eb5b77f70')
b2sums=('1607122efa4f57c58b00da6e32e0a453b77dc7a9a9dc3676b6e38bfc13d2af4336bba85d8c535696fcf00ebb16f5749bbf245d4a9817597d2b2b066af497b0b8')

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
