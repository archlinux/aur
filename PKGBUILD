# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HIBAG
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="HLA Genotype Imputation with Attribute Bagging"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  onetbb
  r-rcppparallel
)
checkdepends=(
  r-gdsfmt
  r-ggplot2
  r-reshape2
  r-snprelate
)
optdepends=(
  r-gdsfmt
  r-ggplot2
  r-knitr
  r-markdown
  r-reshape2
  r-rmarkdown
  r-rsamtools
  r-seqarray
  r-snprelate
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('036f291cc4459eea70841c1926a156a8')
b2sums=('a2fcf57b1aeac8414d2e725dd6f3b6688838f62ca71d88a1c1f31a686c479703ee7a94ecbf81d6bd9b879a0f9a78efc1f452620dcc4518d5a2a1a55c0fa3155f')

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
