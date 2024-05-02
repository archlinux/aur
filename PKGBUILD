# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CaDrA
_pkgver=1.2.0
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
md5sums=('5269578a8ed6576b2c3090d4713005b1')
b2sums=('7dc6fe35080f6edc5e9b3c5119c3a65009521138f355c233b966b7514aa01499e609098eb4680652dc820d4c283c6149e5252eb330c6e6579f1975074d1f041d')

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
