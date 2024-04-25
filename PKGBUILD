# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppGSL
_pkgver=0.3.13
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="'Rcpp' Integration for 'GNU GSL' Vectors and Matrices"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  gsl
  r-rcpp
)
checkdepends=(
  r-tinytest
)
optdepends=(
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d03bf65ffa004822e2169c382ee1033c')
b2sums=('d322e4071c8b5a5df68192241151a032cd7b4f99511537c27f33d6ff75b0fcf127862f6b9e8397d4c82a4adbfd2a9116b6535d7d7b699d489d00224690467b84')

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
