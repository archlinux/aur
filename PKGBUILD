# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alabaster.files
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Wrappers to Save Common File Formats"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-alabaster.base
  r-biocgenerics
  r-rsamtools
  r-s4vectors
)
checkdepends=(
  r-digest
  r-testthat
  r-variantannotation
)
optdepends=(
  r-biocstyle
  r-biostrings
  r-knitr
  r-rmarkdown
  r-rtracklayer
  r-testthat
  r-variantannotation
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('114f05ad24fdb164025a173ce6383730')
b2sums=('7de57c735e1b7aa19d99a90618109431790315235e9fe9dd1c4b4ae090919f35de720cf2162c1845eab2a0f5688d39d91e9901592854da50b132609c3ceda131')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
