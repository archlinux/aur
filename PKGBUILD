# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ompBAM
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="C++ Library for OpenMP-based multi-threaded sequential profiling of Binary Alignment Map (BAM) files"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-rcpp
  r-zlibbioc
)
checkdepends=(
  r-devtools
  r-rcppprogress
  r-testthat
)
optdepends=(
  r-desc
  r-devtools
  r-knitr
  r-rcppprogress
  r-rmarkdown
  r-roxygen2
  r-testthat
  r-usethis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('867d3c1d9d846bfea4545c18509ed756')
b2sums=('8d860185474677c4d57bba1684794b76253fac095df9fe98a9190e4c663ec4681b2d9bdfee9ab083584d527db9eb20d7ab60ce6f3408c3517733e0962867ddf0')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
