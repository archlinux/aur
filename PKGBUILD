# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Jooa <aur at (name) dot xyz>

_pkgname=raster
_pkgver=3.6-30
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('9e198130e8def3ccb4b448b66965dae6')
b2sums=('aec52270aebf5f0f2dc82bedec5d94cade55714deb2ceb7969af1d59b7354e9d5a270f09ccea5eef8efa50574b83b7ae5f38c789ce0e60de93b0855bab07dca8')

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
