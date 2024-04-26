# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ompBAM
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('9e9d31ddcad0b4bb4acb30ad970a0cd5')
b2sums=('830df567c67e8e45b72384ff9441b519753741ad36df4106016d82aa3772f936ed8d89c4d8a6909797029707d7a9d4b0a97e9bc8850a8e9695a41b7a90db6f88')

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
