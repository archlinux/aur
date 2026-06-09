# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bigmemory
_pkgver=4.6.6
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
md5sums=('ed382733999638df600ab5f7e633e5ee')
b2sums=('529c0631592732a28f97554beb88a339f16f79cfbbc8e958109a8cdc943e08497deaacb3220a3d5adc36692b893903d20080575d8ea395f5bfaeb54b3513da6d')

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
