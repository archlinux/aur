# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=diffuStats
_pkgver=1.28.0
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
md5sums=('b7ced3e30943161349328bc91bd5dd24')
b2sums=('7c94a1a46aac782a0686146a22b38be0e3039f651f8ac7a154f584a4d3ca13fa691daeae812c54f999fa8295262f922f186f98191c377f142b6a67868151c833')

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
