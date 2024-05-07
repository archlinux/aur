# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=escape
_pkgver=2.0.0
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
md5sums=('7b3c16032574ae1639cf3d8b0f4eda1a')
b2sums=('85b0342930e2971515787fbd0739062c8a8faecb6a8bb7a73b93c9fe8c79994c90a4b8fa3f3cf0919e155f3cd316d6afc15f5e55335cd49b93cbd7ebadacc5bd')

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
