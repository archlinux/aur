# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BASiCStan
_pkgver=1.6.0
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
md5sums=('5525d5dc42ee9564bcde9f4b1e594cdb')
b2sums=('6284991bd0ae29f630e7963288f1398dfbbba416cd7adea00c2605b83c7965cc4857965d773af2bd69e9596c34fd662913b25f2c95ba9afb9f406c3126f93d49')

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
