# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=DescTools
_pkgver=0.99.59
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for Descriptive Statistics"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-cli
  r-data.table
  r-exact
  r-expm
  r-gld
  r-haven
  r-httr
  r-mvtnorm
  r-rcpp
  r-readxl
  r-rstudioapi
  r-withr
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-r.rsp
  r-rdcomclient
  r-testthat
  r-vgam
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('018aca3bf3265a21f9f839f07b923f6d')
b2sums=('4d58ff9b77aa4941cf74b52ca49db13ab2d73aef4d4add04619cb09839a23d1192eff2c14b1acd60e68c34ab81ea06a9d905a4321a5ef022e3a7021155ebbb9c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla misc.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
