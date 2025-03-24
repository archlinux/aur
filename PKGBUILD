# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Kiri <kiri@vern.cc>

_pkgname=RProtoBuf
_pkgver=0.4.23
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="R Interface to the 'Protocol Buffers' 'API' (Version 2 or 3)"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  abseil-cpp
  protobuf
  r-rcpp
)
checkdepends=(
  r-tinytest
)
optdepends=(
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('02d14296c87b0a73ca8b988da459f48c')
b2sums=('16db97d24df02e9c36e3f7d6e78d716794864cfea3dd28e3fda732bbcd4261f64af1a5469183a2d7c84d8fabfb63c398a9c4a49ef329b0dbae424eea016e30fd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

#check() {
#  cd "$_pkgname/tests"
#  R_LIBS="$srcdir/build" Rscript --vanilla tinytest.R
#}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
