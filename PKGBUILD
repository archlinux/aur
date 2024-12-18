# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SPOTlight
_pkgver=1.10.0
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
md5sums=('638290a97f214a906f347c6bb5a8c5dd')
b2sums=('72c8447f9a92f3ce393642933c277d580b207875cf1c183e9e079062e985ece9921daa1af9e139119fa52fe61173e5aea698d8d60987fbb257f04bf07ac8e791')

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
