# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=seqArchR
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('51de82aa4ddab7b96a23a2bf7125e07b')
b2sums=('f87aa51f3fcac6c97753b7328927671d833157516f92741d72142f4596aafc3db2a8b6ae67158cf56e5265d96b71048bd6aee110ec5612db7f258c8f8dd333e3')

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
