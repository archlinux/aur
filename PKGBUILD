# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BASiCStan
_pkgver=1.8.0
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
md5sums=('a4186cc4e1dc5ff03d112a63c06acc09')
b2sums=('b3b865d3919351252c690627f39d04cea64bc04005955bac41c854e2f212df3a6b0f742716f6c69699bd079c3cbf1280155a0b3100a6e128809dec8e51cf7e4e')

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
