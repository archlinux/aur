# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=DescTools
_pkgver=0.99.55
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
md5sums=('c0047d5b19c34cfd7f9ab9ae987f755d')
b2sums=('960da777b61fbd2dc7c13dde9d67fbef88717a5599737267fd15747a16b69c1f374299d89b10963eecf2610384c4c0b39fa010d06764021a279e39025d81d4d4')

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
