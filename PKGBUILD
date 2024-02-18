# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=variancePartition
_pkgver=1.32.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Quantify and interpret drivers of variation in multilevel gene expression experiments"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-aod
  r-biobase
  r-biocparallel
  r-corpcor
  r-fancova
  r-ggplot2
  r-gplots
  r-iterators
  r-limma
  r-lme4
  r-lmertest
  r-matrixstats
  r-pbkrtest
  r-rdpack
  r-remacor
  r-reshape2
  r-rhpcblasctl
  r-rlang
  r-scales
)
checkdepends=(
  r-biocgenerics
  r-edger
  r-rfast
  r-runit
)
optdepends=(
  r-ballgown
  r-biocgenerics
  r-biocstyle
  r-cowplot
  r-dendextend
  r-deseq2
  r-edger
  r-knitr
  r-pander
  r-r2glmm
  r-readr
  r-rfast
  r-rmarkdown
  r-runit
  r-statmod
  r-tximport
  r-tximportdata
  r-zenith
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cd02e6e3024f4f5bbb5d8c1dcb471d15')
b2sums=('c7e03d37c1afd7886acb61c0a6fa71166b2cd3eaf46f57e036a81526444100065a2254cd220dca2ba0aeac2412a1a5d2e6a265c6ec84b09f0c1a8879bb6447d3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
