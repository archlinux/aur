# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clustifyr
_pkgver=1.24.0
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
md5sums=('5d04e7c57e758350875b084e055cc98a')
b2sums=('a27be0e1cd133d5e531017de13ddad9443d6aa72a91fa985a30a60a2bfa447da1d53604bfe7de10a0d675d1d4849754f81c8d22aad3d51b4abe3aae538bb8374')

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
