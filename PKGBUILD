# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SPOTlight
_pkgver=1.12.0
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
  r-spatialexperiment
  r-summarizedexperiment
  r-tabulamurissenisdata
  r-tenxvisiumdata
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('62f688f9387fa8384e461769df65e1e2')
b2sums=('c7a9d1693eae18250cfa04035cbd41ecc55cb46681765bf274a8c1b4d5cf849527f9083de903fef011a60d618f0ee6673cd0586b28ffc44b4e5f91f288a13650')

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
