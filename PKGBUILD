# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=terra
_pkgver=1.9-1
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
md5sums=('db34e69683c48997f43d51cc357e5c75')
b2sums=('47c198b9008a654c84ae43baa7cf09af6552de0aa7e4221271b9a64196312dd23b05e4564f47c86b7e7fd78f6b3c8129c40e9afcfb5d785ea700d0b712d7f8bc')

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
