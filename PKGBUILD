# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=diffuStats
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Diffusion scores on biological networks"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  onetbb
  r-checkmate
  r-expm
  r-igraph
  r-plyr
  r-precrec
  r-rcpp
  r-rcpparmadillo
  r-rcppparallel
)
checkdepends=(
  r-reshape2
  r-testthat
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-ggsci
  r-igraphdata
  r-knitr
  r-reshape2
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('898b1d3d9490425dac135e1cc272f6f7')
b2sums=('788328dc8e4a6e40ce6310c8b8a89650cf5d6fbdce1ab515c72c458e64c83f51c610041c863ff1c9e3464da8c5c704cf4e582731cb86140e685fdb86bd84016a')

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
