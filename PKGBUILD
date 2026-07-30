# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=optimParallel
_pkgver=1.0-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Parallel Version of the L-BFGS-B Optimization Method"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
checkdepends=(
  r-numderiv
  r-spam
  r-testthat
)
optdepends=(
  r-ggplot2
  r-lbfgsb3c
  r-microbenchmark
  r-numderiv
  r-r.rsp
  r-roxygen2
  r-spam
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e8e2a6c66f42adf4063bfc6c855185a1')
b2sums=('2e4869e7b3ad046e286a81e7bd68eea0afeb41829a8e35b1d350b7e347c18290ea49c14717933f1b0655bfb7e0e653e250447e4bb7572722e1fd4c4028c22235')

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
