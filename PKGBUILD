# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=variancePartition
_pkgver=1.32.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Quantify and interpret drivers of variation in multilevel gene expression experiments"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL2)
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
md5sums=('75a8e840769ba62b9f175c73aba9c99a')
sha256sums=('bd6c96ec3d8eebcb0ab387e0754df79fbb00b1557cc37d42f169a4a2d278ac32')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
