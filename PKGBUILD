# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggsc
_pkgver=1.2.0
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
md5sums=('9b2e1ac75f9a734608bdd581df506a74')
b2sums=('774daf3d454078ef8c355f7817c546e7b84d9006f8ecf994e984ce7e20b1e7943cec296cb7fab90a0c50a55d0fe88f44ed245e252fbf08f0103f878420c99eba')

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
