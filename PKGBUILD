# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Cepo
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Cepo for the identification of differentially stable genes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocparallel
  r-delayedarray
  r-delayedmatrixstats
  r-dplyr
  r-ggplot2
  r-gseabase
  r-hdf5array
  r-patchwork
  r-purrr
  r-reshape2
  r-rlang
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-covr
  r-escape
  r-fgsea
  r-knitr
  r-pheatmap
  r-rmarkdown
  r-scater
  r-scmerge
  r-testthat
  r-upsetr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f8d17929e7b04b4a4a2c4691dd8f51d9')
b2sums=('5d258c88d4ed1db0aff01ed2da0b3a2ac407068e91cacec55e3b17047a67330f87bf848e816d1b9f9a3fd7429f1a3d976e220874b98cd50308c1b2df74bd1a64')

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
