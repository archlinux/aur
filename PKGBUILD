# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=benford.analysis
_pkgver=0.1.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Benford Analysis for Data Validation and Forensic Analytics"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-data.table
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9e2e2f2182c40d45109cc1ddb4257bce')
b2sums=('1a6dad033d60f7a0adfb7deb5044021732100922ad740b2ecd740c78ff8d4f95eca1dfc5b5cf7fd31b1ede85b5299f4c8980e81ffb917064a94fd7b511077941')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla run-all.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
