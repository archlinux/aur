# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=lwgeom
_pkgver=0.2-16
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bindings to Selected 'liblwgeom' Functions for Simple Features"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  geos
  proj
  r-rcpp
  r-sf
  r-units
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-covr
  r-geosphere
  r-sp
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8d7e158637d6192c81f05fec0b8fabf9')
b2sums=('84602ca9402f3a94f07a26a09083872cf1588fd832a7f211726d3f8fc3bf9db30a0cf3367b1ad183ec7088fa2ce611bb25713ae75739e657c555ad3d3cc32398')

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
