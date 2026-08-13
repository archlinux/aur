# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BASiCStan
_pkgver=1.14.1
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
md5sums=('1e7bbc2066ec713f191d063536f483ae')
b2sums=('b442410e3c29f7143f3afbdb4b6651caa53051d32e730e545cede4cf216c467064b6f7c05901b1c412dfb52a473c3aa6305c0cf05c7500b0d59c0942f5e46457')

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
