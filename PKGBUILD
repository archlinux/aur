# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RegionalST
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Investigating regions of interest and performing regional cell type-specific analysis with spatial transcriptomics data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-assertthat
  r-bayesspace
  r-biocstyle
  r-colorspace
  r-dplyr
  r-fgsea
  r-ggplot2
  r-gridextra
  r-magrittr
  r-rcolorbrewer
  r-s4vectors
  r-scater
  r-seurat
  r-shiny
  r-singlecellexperiment
  r-summarizedexperiment
  r-tibble
  r-toast
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-gplots
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4389931e6a1b874cd28b9c9cdba4bf90')
b2sums=('1e43d6fb74445f3e0071a66361c290bdc6356331a6ac5aaedb106a13b032ca3434fa5fead7074e145a22fb213ddb9920c225b2a9d153ea1ace8b8a282bef78a9')

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
