# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=seqArchR
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identify Different Architectures of Sequence Elements"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
sha256sums=('0eaabb037d55fbea2ca2919eac7f85019b1eb852c76338428a61d89f3481dff6')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
