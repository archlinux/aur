# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=anytime
_pkgver=0.3.13
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Anything to 'POSIXct' or 'Date' Converter"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-rcpp
)
makedepends=(
  r-bh
)
checkdepends=(
  r-tinytest
)
optdepends=(
  r-gettz
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4b7f3b5eb78e3bc05905598dd6f8267a')
b2sums=('f7c62799890857cdb5a82612e2f5843a9cb7f3437347923e4314cf3000653bee02e4a165124eb16902840f07209b24e41f393a1f81abf6fcb6f5ac24269edd89')

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
