# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tadar
_pkgver=1.2.1
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
md5sums=('63b8401414abc199507181f5eec9dae5')
b2sums=('0cd6671c60e92feae41c55402eaebf89dc2be04a04c3991dfdb4f41eeb41f08ac2b4c593078248ce75bfa9cb0b28b63f34b4b1799b70f913a99cff80b674930e')

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
