# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bigmemory
_pkgver=4.6.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Manage Massive Matrices with Shared Memory and Memory-Mapped Files"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-3.0-only OR Apache-2.0')
depends=(
  r-bigmemory.sri
  r-rcpp
  r-uuid
)
makedepends=(
  r-bh
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-remotes
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6b58104bfb99f48c0ff3b26c6f6fc441')
b2sums=('d20cc509baef7a6f5b6bc2b94c937ca8d5ef5f97962a40cdd35375987813a387edea3a3b0c3825f84dde088987ba6523bc311192d986062ff7fa6d3958aa4e62')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
