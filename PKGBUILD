# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=escape
_pkgver=2.2.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Easy single cell analysis platform for enrichment"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-aucell
  r-biocparallel
  r-dplyr
  r-ggdist
  r-ggplot2
  r-ggpointdensity
  r-ggridges
  r-gseabase
  r-gsva
  r-matrixgenerics
  r-msigdbr
  r-patchwork
  r-reshape2
  r-seuratobject
  r-singlecellexperiment
  r-stringr
  r-summarizedexperiment
  r-ucell
)
optdepends=(
  r-biocstyle
  r-hexbin
  r-knitr
  r-markdown
  r-rcolorbrewer
  r-rlang
  r-rmarkdown
  r-scran
  r-seurat
  r-spelling
  r-testthat
  r-vdiffr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('af1fa9eb8df3252a960cd70ba2f41873')
b2sums=('05bbd9694bb753799b7b7a614e1a27203ff6d76c984e6e80051d358c40d90d87ac13c6c73c9c58288f8f1c6c00a47f7ed1f5733a38edab80485d30938d6db7e4')

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
