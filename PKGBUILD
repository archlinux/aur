# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BASiCStan
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Stan implementation of BASiCS"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  onetbb
  r-basics
  r-glmgampoi
  r-rcpp
  r-rcppparallel
  r-rstan
  r-rstantools
  r-scran
  r-scuttle
  r-singlecellexperiment
  r-summarizedexperiment
)
makedepends=(
  r-bh
  r-rcppeigen
  r-stanheaders
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2ffa79df4fb515b8329d51a8c172cb96')
b2sums=('a037d950916804f31d0387a99d9f2daf1fd84a2fccef9c5da93a08e5bf8a94e5c4b9f1cb88a2a33e09f3fed454cf7758223f8c69cd1631bf01b6dd64b952743f')

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
