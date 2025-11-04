# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ompBAM
_pkgver=1.14.0
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
md5sums=('07b9ed7aec0d08c6b82a0616611862b7')
b2sums=('d56411edbe312304ebd32e7007a7ffb102c6345bf0b04963cfbb793efc9ab0d6e6ce2fd9881fa62f93b34e2773855d75d419e70d4d684e8ad3193ca2d4964bd4')

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
