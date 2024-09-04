# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clustifyr
_pkgver=1.16.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Classifier for Single-cell RNA-seq Using Cell Clusters"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-cowplot
  r-dplyr
  r-entropy
  r-fgsea
  r-ggplot2
  r-httr
  r-matrixstats
  r-proxy
  r-rlang
  r-s4vectors
  r-scales
  r-seuratobject
  r-singlecellexperiment
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-complexheatmap
  r-covr
  r-data.table
  r-ggrepel
  r-gprofiler2
  r-knitr
  r-purrr
  r-r.utils
  r-remotes
  r-rmarkdown
  r-shiny
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3ce075a00bdba5d75946e21236efc235')
b2sums=('b7d0acf0d1ef312a43eba361582083d93e1f24a19740ffa597bc581cf941de075f38cdd74682b5fab458d21b06b31bb3b919ee809c256f283a8370c19aa50284')

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
