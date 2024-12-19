# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=anytime
_pkgver=0.3.11
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
md5sums=('f690eb410d0212aa1701e9ea58015ca9')
b2sums=('83c282ce2db7b160453d8c0aa26db1129b130738a3d76c52efddc7eeaa424524676961c67028a13315800c50f580c2fe9917877c3381219efd99ff75eee902fe')

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
