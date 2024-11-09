# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clustifyr
_pkgver=1.18.0
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
md5sums=('d77ecc21f83dc756601f836e80765342')
b2sums=('ba47c45ac9095d4b2c7080dd1e0cd6024c2aa8db4895cd04deeef080e5a4f16538d690843d658b55be5ba1d1e9ad607b784cf3d2b1760ecf8e57699ea79c973d')

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
