# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rust
_pkgver=1.4.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('50a94d316fe586446812ab92a4a3e9cc')
b2sums=('6472cac6bc2fa208611d4c7244b2417db979f716b84d040cc57680eb6faab618024176dd1f2c8575ebeac4579e557639c03e35c995438f7d456c9d08fd05634a')

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
