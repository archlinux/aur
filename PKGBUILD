# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=zenith
_pkgver=1.4.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Gene set analysis following differential expression using linear (mixed) modeling with dream"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-enrichmentbrowser
  r-ggplot2
  r-gseabase
  r-limma
  r-msigdbr
  r-progress
  r-rdpack
  r-reshape2
  r-rfast
  r-tidyr
  r-variancepartition
)
checkdepends=(
  r-biocgenerics
  r-runit
  r-tweedeseqcountdata
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-edger
  r-kableextra
  r-knitr
  r-pander
  r-rmarkdown
  r-runit
  r-tweedeseqcountdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('60c9729fb2407d62a1ea15b1aa5ee0eb')
b2sums=('93539baaded7a4fc4f5f5ecf873e6d8ff81d3cf138ad6b89a47562396b6b4d7ec9fd01a693aabfa9edef31dca875e9f5a7a0e400452631be26c86a84e4fd8782')

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
