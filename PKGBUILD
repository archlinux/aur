# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggsc
_pkgver=1.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Visualizing Single Cell and Spatial Transcriptomics"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  blas
  onetbb
  r-cli
  r-dplyr
  r-ggfun
  r-ggplot2
  r-rcolorbrewer
  r-rcpp
  r-rcppparallel
  r-rlang
  r-scales
  r-scattermore
  r-seurat
  r-singlecellexperiment
  r-summarizedexperiment
  r-tibble
  r-tidydr
  r-tidyr
  r-yulab.utils
)
makedepends=(
  r-rcpparmadillo
)
checkdepends=(
  r-scuttle
  r-testthat
)
optdepends=(
  r-aplot
  r-biocparallel
  r-forcats
  r-ggforce
  r-ggnewscale
  r-igraph
  r-knitr
  r-ks
  r-prettydoc
  r-rmarkdown
  r-scater
  r-scatterpie
  r-scran
  r-scuttle
  r-seuratobject
  r-sf
  r-shadowtext
  r-spatialexperiment
  r-stexampledata
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7d7bb7d30ddcf0f5114f75e2a3e82897')
b2sums=('d84e4ae8ac02098e2da4fcf2796056b482e8f517b5773032d1a7c08f82f732223052a3fc1b599cdc03e4f2ff8a739082b86c28ece86f4f7b72c1ba168b9616e3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
