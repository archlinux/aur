# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Kiri <kiri@vern.cc>

_pkgname=exactci
_pkgver=1.4-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Exact P-Values and Matching Confidence Intervals for Simple Discrete Parametric Cases"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-ssanv
  r-testthat
)
optdepends=(
  r-blakerci
  r-exact2x2
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('447f19a10800a1e7ac09201268e83c3a')
b2sums=('b1a387879c8b8c4d88ebf327b326ae87fee69b78cc7c0cbd63b70a50840767a6ee66f4f60e0c73aa3cee430c746fe4bbe83cc0d70800fb02c465b0530cdf2e79')

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
