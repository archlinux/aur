# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggsc
_pkgver=1.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Visualizing Single Cell Data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  blas
  r-cli
  r-dplyr
  r-ggplot2
  r-rcpp
  r-rcppparallel
  r-rlang
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
md5sums=('4c0a1656e9943cadf436244c65b18242')
b2sums=('d8d67ddaf34fbdb71347226f6e916c22fd1338716a2b308e15b6d799e133dd9b9b7fba108b7e5792aed38c65efb4469cf9241cb2f3f50b3c2301c79cf169c228')

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
