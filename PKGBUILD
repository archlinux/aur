# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=DescTools
_pkgver=0.99.58
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
md5sums=('43190006357da42f751d6c6522f4bea8')
b2sums=('a76e0819bc5d0ec22874a5f16d4814441fb697f6b79c123cf8e76f15149d320b00cc33a0d13d08bcaba0ff108bc5e9c7807ca52559eb62778d90934a95760304')

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
