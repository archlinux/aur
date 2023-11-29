# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BASiCStan
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Stan implementation of BASiCS"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
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
md5sums=('b7179ffcf510240c0c3cc6e8e31b60d7')
sha256sums=('3176517994f10d6a9dd9571ae1d51d87e9ef2d5aed81da215b5a195ba516ea06')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
