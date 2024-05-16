# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dqrng
_pkgver=0.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast Pseudo Random Number Generators"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('AGPL-3.0-only')
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
  r-bh
  r-knitr
  r-mvtnorm
  r-rmarkdown
  r-sitmo
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6f9eb0bb16740498a472a1ac2e121308')
b2sums=('c04fa5c14770c54039dc49f50e120438931712aa32fc9c99c11813a335623da3f8e701955ca29943c55c34c6d9069d7a15ec93b6237eb9cb6724f421a2751844')

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
