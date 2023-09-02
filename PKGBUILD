# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rust
_pkgver=1.4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Ratio-of-Uniforms Simulation with Transformation"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  blas
  lapack
  r-rcpp
)
makedepends=(
  r-rcpparmadillo
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-bang
  r-knitr
  r-microbenchmark
  r-revdbayes
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9d8424e8478cd18d4c0f255547ebd747')
sha256sums=('376f19690727653a70effd40c06720caa326551176a381f2832ff992c04b4b08')

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
