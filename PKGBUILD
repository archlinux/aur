# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CaDrA
_pkgver=1.12.0
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
md5sums=('0361f358a713f63e3549fe2e040f3600')
b2sums=('7647a1de79a8ac5992fbc394e9ef8cb8a7ea48f4c39314afb4e90c46a2ea24fb57ab881f88709a743c306fe94a9d3a82876875e6e9d6281d7dacac7013a7a936')

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
