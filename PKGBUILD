# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=exdex
_pkgver=1.2.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Estimation of the Extremal Index"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-chandwich
  r-rcpp
  r-rcpproll
)
makedepends=(
  r-rcpparmadillo
)
checkdepends=(
  r-testthat
  r-zoo
)
optdepends=(
  r-knitr
  r-revdbayes
  r-rmarkdown
  r-testthat
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e46c9bf868db55d0b9729a029e9ebfe8')
b2sums=('47c732eead48c18552cc21ef1616ecefe94e3aac834ef75873b352e95e27f5b3fcf6c8f40db9c7bca86a16b0d9803753cce25836e20cf6e03b2fc162854d8a17')

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
