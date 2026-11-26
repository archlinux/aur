# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HIBAG
_pkgver=1.50.0
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
md5sums=('079ab9066f18caf1ff1da829e26515cf')
b2sums=('ca43d2f0c9df7e2b802cdca9d2cfa03467ec66ba29d4d67dfa9ccd95c001eb06170d991e3a9d47806f339036bbc108820b3fb1f8483d57acaaed9f0849fe5639')

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
