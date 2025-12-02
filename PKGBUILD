# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=diffuStats
_pkgver=1.30.0
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
md5sums=('d66467c23ce2aaf97842b36f26985f92')
b2sums=('6f99a41ac3348973febefa72b91b9aa4fd63a07ceb492a0097fdecf18314d505268a7b41d7d0a9294bf88357548e61b188e55906603ca89aa58e16939a3501e4')

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
