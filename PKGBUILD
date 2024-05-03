# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tadar
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Transcriptome Analysis of Differential Allelic Representation"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocgenerics
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-gviz
  r-iranges
  r-matrixgenerics
  r-rlang
  r-rsamtools
  r-s4vectors
  r-variantannotation
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-limma
  r-rmarkdown
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('10f5349af7e634695d7f22e6f90d371d')
b2sums=('4d164c3c396c71bf721adfee6baf02a14c79e70491505dbac4bd2f3d7c2a33e84fdf2463e2f56865cc3a24086aa6e78c35b4502e9f5e8f9803c792ec7a69ed92')

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
