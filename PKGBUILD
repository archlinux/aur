# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ompBAM
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="C++ Library for OpenMP-based multi-threaded sequential profiling of Binary Alignment Map (BAM) files"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
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
sha256sums=('999a53255a63c874ff040cf9d168c19749e710f556c331ea635fcbc6efe0bbfc')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
