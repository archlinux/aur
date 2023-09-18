# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=bigutilsr
_pkgver=0.3.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Utility Functions for Large-scale Data"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r-bigassertr
  r-bigparallelr
  r-nabor
  r-rcpp
  r-robustbase
  r-rspectra
)
checkdepends=(
  r-gmedian
  r-mvtnorm
  r-rrcov
  r-testthat
)
optdepends=(
  r-covr
  r-gmedian
  r-mvtnorm
  r-rrcov
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('49ad25ab76efaab30f5dbaed238f2b31')
sha256sums=('b44b458f4b540deff5af1f956d1dbd138f4fc138cd2d77e35e69d873c406d024')

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
