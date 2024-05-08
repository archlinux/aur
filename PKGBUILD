# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clustifyr
_pkgver=1.16.0
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
md5sums=('e636ea159b4fe186b37a723f523395d0')
b2sums=('f8d280fb46591d82825ad306c3aee5c54d33af416c0c842f44d13cb10b34de69b9acaf441a8662ec7964a2fb6433672fc21e89c2afcd315ddf5b76b81b05076a')

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
