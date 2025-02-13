# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=zenith
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('65211ac331b8038c97aca4f4f8508a56')
b2sums=('1b3b51df7bf1be673d30423d53a894a3709745955675678b2f6660ba05596001e135d5cff2f9ab13a198155f2971a11579330d032cabd537bd6433ca00fe92af')

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
