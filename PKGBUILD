# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Cepo
_pkgver=1.14.0
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
md5sums=('26d6be7e6af55198ba9b8c7965cd7c2f')
b2sums=('94083605e9e8b8461bbb2294ee13d4cd642a32ea850c666f3c226fe70caa97f4cd824a4c87ec06bf35c71df52dcd76fbb898db793bfc4ca6fbab7a4d57d1d255')

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
