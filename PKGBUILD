# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Cepo
_pkgver=1.12.0
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
md5sums=('3af4bf60206bb2421a63d68009a361e0')
b2sums=('7be12bcfb38ffa8d820a046d0b94830dbc2c8efc1d2dc9e735fc321a4a361ed3a78e682e49f90229b0ce235639cd45a3b4221346abc432c48f049e28ed6e4f50')

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
