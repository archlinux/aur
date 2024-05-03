# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RegionalST
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Investigating regions of interest and performing cross-regional analysis with spatial transcriptomics data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-assertthat
  r-bayesspace
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
  r-biocstyle
  r-gplots
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('09f2ca1e03d5642dc250df00c8f3baff')
b2sums=('efd5284f3855ba18b58794570b44211c0a5b214bc2c5ddae3b43f065cb3ccafad162f7389ff0f6b6b9a059d0dd1b8f16f104212b4c7e7ca02dab37b3e8301d52')

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
