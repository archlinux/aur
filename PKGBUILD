# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rust
_pkgver=1.4.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Ratio-of-Uniforms Simulation with Transformation"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
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
md5sums=('493444931ede6baee2118be42b7e01d0')
b2sums=('79fb4b69ddeff807386759b594bf7a015e56ea69daaf82071d4e185ad754aa6aed7f17b0e36d9dd5a4b8cc75c957ef3045775988bc98133903df602aa4a30cf8')

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
