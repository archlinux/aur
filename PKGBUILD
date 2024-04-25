# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=optimParallel
_pkgver=1.0-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('f41a14e30017e5e034f7a1a58d4e8f4c')
b2sums=('5c824734bb06993a23daedd5a5a79f73125c83ece6847613d1059ff1218b321140439e6b63d23c2664cb2c2aba9e1ab3519c8c51b03ddcddf8067081741a5eb9')

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
