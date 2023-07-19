# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bigmemory
_pkgver=4.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=6
pkgdesc="Manage Massive Matrices with Shared Memory and Memory-Mapped Files"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(Apache LGPL3)
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
md5sums=('a0d62857fdeb5244b2c69e98a4a4bf72')
sha256sums=('b56e157c87ed6c4fc69d4cb9c697ae9a2001726e776e41aa7c48b35327b65141')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
