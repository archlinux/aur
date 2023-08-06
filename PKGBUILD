# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dqrng
_pkgver=0.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
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
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1d8a69247f64e1d98d169fe69919b97c')
sha256sums=('4beeabfe245ce7196b07369f2a7d277cb08869ad8b45a22c6354c4cc70a39abb')

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
