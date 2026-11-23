# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ReactomeGSA
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Client for the Reactome Analysis Service for comparative multi-omics gene set analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biobase
  r-biocsingular
  r-dplyr
  r-ggplot2
  r-gplots
  r-httr
  r-igraph
  r-jsonlite
  r-progress
  r-rcolorbrewer
  r-summarizedexperiment
  r-tidyr
)
optdepends=(
  r-devtools
  r-knitr
  r-reactomegsa.data
  r-rmarkdown
  r-scater
  r-scran
  r-scrnaseq
  r-scuttle
  r-seurat
  r-singlecellexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ac3c12d24f4dd4dc280d89fa82f32a9c')
b2sums=('9163be542c39487981347c1fa21f84b286c7bf96339e670a019fc3348b5083682809c2ecb9f6845cfb72e48651ec75aaecde19a8cb6ce90d15886c56b2aa6c82')

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
