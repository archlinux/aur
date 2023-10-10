# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HIBAG
_pkgver=1.36.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="HLA Genotype Imputation with Attribute Bagging"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
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
md5sums=('db885989e0e66d6ddad9fa71425a34d2')
sha256sums=('8a5c38950418db1cd6ab9c017d4c7c715b31b4b94d878d17bd6219934e3b93b1')

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
