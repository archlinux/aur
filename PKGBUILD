# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ReactomeGSA
_pkgver=1.28.0
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
  r-scrapper
  r-scrnaseq
  r-seurat
  r-singlecellexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fcb6916cb6a5fdc03d6c32813911b646')
b2sums=('f5097c47fd2370576b3ed2e959132799a568fcf242ba58d4a953d28bec9fe68204d67c67371a48711515b13e70fe3694576cf487ec1efcfbf9ab5ea2ba5460de')

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
