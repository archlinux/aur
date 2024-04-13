# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SPOTlight
_pkgver=1.6.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="\`SPOTlight\`: Spatial Transcriptomics Deconvolution"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-ggplot2
  r-matrixstats
  r-nmf
  r-nnls
  r-singlecellexperiment
  r-sparsematrixstats
)
checkdepends=(
  r-dropletutils
  r-experimenthub
  r-ggcorrplot
  r-igraph
  r-jpeg
  r-png
  r-scatterpie
  r-seuratobject
  r-spatialexperiment
  r-tenxvisiumdata
  r-testthat
)
optdepends=(
  r-biocstyle
  r-colorblindness
  r-delayedarray
  r-dropletutils
  r-experimenthub
  r-ggcorrplot
  r-igraph
  r-jpeg
  r-knitr
  r-png
  r-rmarkdown
  r-s4vectors
  r-scater
  r-scatterpie
  r-scran
  r-seurat
  r-seuratobject
  r-spatialexperiment
  r-summarizedexperiment
  r-tabulamurissenisdata
  r-tenxvisiumdata
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0362e0be411e3ed3ce5bf9b928439e10')
b2sums=('1ea3f06da6af3f44a60c4542032540f72c65304cbce72b1f8132394338ff3d54901989e9bb6027a71a79be292bdcb5252d2dea3ea9a7fa9bddafc8d654828497')

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
