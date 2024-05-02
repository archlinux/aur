# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=variancePartition
_pkgver=1.34.0
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
md5sums=('6166b37eba7db10f4e8bbf9044193c03')
b2sums=('b560920af31c71417053627beab9c7a05d021ae6130ff562da9abd877ad604c32e0d4cc55040933c0d29e77ee0d1bdfb992a72af68238e23344735eae744fb69')

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
