# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=variancePartition
_pkgver=1.32.3
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
md5sums=('8a4ece91ac81a08e3f3671f4513caf72')
b2sums=('95ee41908a1171fb956cff170d316885d5dc6b4cd01c1c85ebd69f4f3bbd21cc4a0b5616d8709d408f76198d0ee14ec74a3ff198ada5b1105cdcea412d2ddbf8')

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
