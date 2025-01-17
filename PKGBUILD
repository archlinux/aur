# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Jooa <aur at (name) dot xyz>

_pkgname=raster
_pkgver=3.6-31
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Geographic Data Analysis and Modeling"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-rcpp
  r-sp
  r-terra
)
checkdepends=(
  r-tinytest
)
optdepends=(
  r-exactextractr
  r-fields
  r-gstat
  r-igraph
  r-ncdf4
  r-rastervis
  r-sf
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('015f72202c45a78306b942c4a3027f5e')
b2sums=('5b934b8fb3d6f6dd78ca2834382d9a4254faadaf45ffefec3c9f0d9cf3e726bdc832a40d4bf9fc231fb46de449885a1061bc0f7ea10b38584197a37144cbaeca')

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
