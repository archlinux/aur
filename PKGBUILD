# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=seqArchR
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Identify Different Architectures of Sequence Elements"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  python-packaging
  python-scikit-learn
  r-biocparallel
  r-biostrings
  r-cli
  r-cvtools
  r-fpc
  r-ggplot2
  r-ggseqlogo
  r-matrixstats
  r-prettyunits
  r-reshape2
  r-reticulate
)
checkdepends=(
  r-testthat
  r-vdiffr
)
optdepends=(
  r-biocstyle
  r-covr
  r-cowplot
  r-hopach
  r-knitr
  r-rmarkdown
  r-testthat
  r-vdiffr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b991ca99e52e357f8ef95a3a75a1decc')
b2sums=('070a7f2d571958f75847beb84f63bdb935738e85a511d359ab977407478f897a140cb936c011f3663b568d8f3cfa5797bb756c19d0c49d8fb5ace3b4e70ff7d3')

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
