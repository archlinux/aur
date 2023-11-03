# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=optimParallel
_pkgver=1.0-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Parallel Version of the L-BFGS-B Optimization Method"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
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
sha256sums=('0f9bc62c23d9005130f2892bf5eaecf308fa48a727bdd5e19b7dcd1d95f30a9d')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla run-all.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
