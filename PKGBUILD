# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SPOTlight
_pkgver=1.8.0
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
md5sums=('27478472e9aca4692dff302dcb4efe07')
b2sums=('2776d700ebff3f3035d64a18797402ab5455c0b2c1e3640254c7ac3db6b337f454cbc38af093e831c1e7aa8e4e0fc7e2302348915a2c2263c5c919088e6fb07f')

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
