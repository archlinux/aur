# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=variancePartition
_pkgver=1.38.1
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
md5sums=('c8a6fa1251bf05c3ddc3b75268337186')
b2sums=('05e20fd4834572d4955da6af303e1ab86f5fb3bd3235d3dd398960c7c73017113e01ef435a8046402eca6d7d4089eea403609a5feabbef3ec33ac0f52d5c45e2')

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
