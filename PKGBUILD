# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dqrng
_pkgver=0.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast Pseudo Random Number Generators"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(AGPL)
depends=(
  r-rcpp
)
makedepends=(
  r-bh
  r-sitmo
)
checkdepends=(
  r-mvtnorm
  r-testthat
)
optdepends=(
  r-bench
  r-knitr
  r-mvtnorm
  r-rmarkdown
  r-sitmo
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ef9d3b1352d68335b5b462e3661cdc53')
sha256sums=('e230862ad9cdef0a3d5dfe6715e23073fe89534aed2cc256804915d0a35db96e')

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
