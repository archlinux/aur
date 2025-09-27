# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=terra
_pkgver=1.8-70
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
md5sums=('9a5f988c295f2d74019ea2fdfa79fc62')
b2sums=('641a9fb828a345e96404a403d1fd04e6ad6662e88ff46e6a7b35117f60b13cdad76d420029dd551c8f72bf37b9dc0ddb0bf41fbc8e7095ecbebac220a1a1bad6')

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
