# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tadar
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Transcriptome Analysis of Differential Allelic Representation"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocgenerics
  r-genomicranges
  r-ggplot2
  r-gviz
  r-iranges
  r-lifecycle
  r-matrixgenerics
  r-rlang
  r-rsamtools
  r-s4vectors
  r-seqinfo
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
md5sums=('d889b1dd968c9dbc9cb6f08a963184c4')
b2sums=('c19fb217058be79d685a99076469e47ede737fdaf5c301210ae6c38f59f55d9bdc96020a0a731c4245493a2927e1a6d0d20c7f0e0580970602eaa62458885e52')

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
