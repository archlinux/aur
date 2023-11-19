# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CaDrA
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Candidate Driver Analysis"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-doparallel
  r-ggplot2
  r-gplots
  r-gtable
  r-misc3d
  r-plyr
  r-ppcor
  r-r.cache
  r-reshape2
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-devtools
  r-knitr
  r-magick
  r-pheatmap
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9ac2bc6afe6632e5fbd00c687ca19bba')
sha256sums=('b44a53457c33a926b8909ecf3cfadb3d99fef978eb3241dcdcaa0117135dd0b0')

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
