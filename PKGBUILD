# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CaDrA
_pkgver=1.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Candidate Driver Analysis"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
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
  r-devtools
  r-knitr
  r-pheatmap
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bd3e1dfd9f62c695b59a02999e648c3e')
b2sums=('dd906e28d7ddb254a3b7eedc1016977e23cfa79c6acea3f5e6ad947e99921a3275b11ebbc0fafb9e6591a6d3f33be329e64e5644a601156bec6fab974fbe2b12')

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
