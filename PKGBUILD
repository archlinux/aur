# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=DescTools
_pkgver=0.99.53
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
md5sums=('7bdd8202a408ceab955709418fa4414e')
b2sums=('021e1ffb0b287b20d1f1cc046069c71eff3d89ba2b72385ca84f374a5e3d3a9f9256c490e53777bd950f155a54cc60788954be36a041e30cb8191c7de4b818de')

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
