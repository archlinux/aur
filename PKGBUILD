# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=retrofit
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Reference-free deconvolution of cell mixtures in spatial transcriptomics"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-rcpp
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-colorspace
  r-corrplot
  r-cowplot
  r-desctools
  r-ggplot2
  r-knitr
  r-pals
  r-png
  r-rcurl
  r-reshape2
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('49b9b5f51633dd804452493d81fcbb7b')
b2sums=('ba6a8ebfc39a75055ddfb3e4b4726f9eb2e446188772dfe89cd7f132e248d3446248c9fdcbe3febd7bb3113f2bb767157c5f1e1b4d6bffc1faeebff1e6f50914')

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
