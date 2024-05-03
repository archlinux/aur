# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=zenith
_pkgver=1.6.0
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
md5sums=('d34baf4f9ee3435a3ddef3e1040023a4')
b2sums=('0b9c7e5811da1635f1c514ad297eefdaf570ec53473318b550afbce64e8fef93439aac53c9b3643b4499cbd8aeca7b7cca09a915aed49f7a613ccdd8352b7aec')

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
