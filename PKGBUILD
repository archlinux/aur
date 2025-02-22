# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ompBAM
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="C++ Library for OpenMP-based multi-threaded sequential profiling of Binary Alignment Map (BAM) files"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-rcpp
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
md5sums=('d88dc9ccb61fdc23ad3660bffa5d78f6')
b2sums=('f83bf81b41aad03766cf50a4f522b7ca4bef909784fcb56d16c073b80cdd090e8cafddb3151320ff64c9e961ab0b365e340e765e847b5b34e06f54e445e7219e')

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
