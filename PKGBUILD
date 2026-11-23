# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CaDrA
_pkgver=1.10.0
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
  r-knnmi
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
md5sums=('5fcb4317557b640cb3a7dfea55f271da')
b2sums=('72bc4a9dc862d3def062f9a1dc752d5be05f441a6ba6807cc2c5da524ea79435e4377f896682b70462630a8795357b10527e3092381e30b7b7ea1bed02502f92')

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
