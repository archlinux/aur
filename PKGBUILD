# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scRepertoire
_pkgver=2.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A toolkit for single-cell immune receptor profiling"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-dplyr
  r-evmix
  r-ggalluvial
  r-ggdendro
  r-ggplot2
  r-ggraph
  r-igraph
  r-inext
  r-quantreg
  r-rcpp
  r-rjson
  r-rlang
  r-s4vectors
  r-seuratobject
  r-singlecellexperiment
  r-summarizedexperiment
  r-tidygraph
  r-lifecycle
  r-purrr
  r-immapex
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-circlize
  r-knitr
  r-peptides
  r-rmarkdown
  r-scales
  r-scater
  r-seurat
  r-spelling
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f01b5d5ee72dbda9f6e3af8ee4f90ed6')
b2sums=('4f7164b9ffae588e265cfcb9081f30d2e5e43fcd46e987b1f30e2ea11c3e8325954d26bc1c3500edc3d87b54aa224706993ebc07a301ca7f9bbfd7d262e9b780')

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
