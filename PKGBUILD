# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RAREsim
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Simulation of Rare Variant Genetic Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-nloptr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cef3f38477d1ae4d43509e67f1690be5')
b2sums=('a28eae8c630e1cd43b20f53e4989d35f005eccbe1ecfbb003621cfe6b81ca7bb57291c858c767d1b3576bf8b16d624c45ca825a7c3be6ea2ad8449ba6dc07d51')

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
}
