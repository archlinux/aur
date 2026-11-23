# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SPOTlight
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="\`SPOTlight\`: Spatial Transcriptomics Deconvolution"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-ggplot2
  r-singlecellexperiment
  r-sparsematrixstats
)
makedepends=(
  r-rcpp
  r-rcppeigen
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
md5sums=('61dd4538e218d7478ad3e6f472a6bcdb')
b2sums=('8417f7e87a0b3264185139f449fd75a0745162a3bc3511faf26a9f0adb3952ce3ed3eec6d20c5adbb06a22978ee9965e51fdae42e725ccb55d65b8fc0acbe179')

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
