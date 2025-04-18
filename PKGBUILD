# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clustifyr
_pkgver=1.20.0
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
md5sums=('8f84ee7bc124c1e8e753299707407f6d')
b2sums=('9896e8c1b3fdac32b6f66a953ec2181a0b5cd7cb133d762973ad671ac75be90710e1001ef96aab696361f7c3c212fca4f3cc2bbd1ce56140b2fb460a065f10e3')

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
