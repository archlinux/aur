# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=zenith
_pkgver=1.4.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Gene set analysis following differential expression using linear (mixed) modeling with dream"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
sha256sums=('e4125d970e64108ee099b916fa4013b9f732ba4198d9ad838c50a27b93d9c373')

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
