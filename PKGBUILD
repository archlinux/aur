# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=terra
_pkgver=1.8-42
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spatial Data Analysis"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  gdal
  geos
  proj
  r-rcpp
)
checkdepends=(
  r-tinytest
)
optdepends=(
  r-deldir
  r-htmlwidgets
  r-leaflet
  r-ncdf4
  r-sf
  r-tinytest
  r-xml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('85317fcc06d5d304851c394c3f733728')
b2sums=('cbe44ffe4ac7ca9e3d78b3e4c45cc1977a8fea85e4708d92b1d1b90698041cd03f20637c769606d9cd41aebf8e96cac5fe06742a5ad7cac9d61db4b608e42a73')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla tinytest.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
