# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ICSOutlier
_pkgver=0.4-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Outlier Detection Using Invariant Coordinate Selection"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-ics
  r-moments
  r-mvtnorm
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-icsclust
  r-repplab
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5f3a2b02876603f8cd642c593295a7bf')
sha256sums=('6605c7c217d0211a2ae35be9f6c01a8b76e111ff51632b1d48144481d5d7cf1e')

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
