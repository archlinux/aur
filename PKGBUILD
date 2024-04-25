# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=revdbayes
_pkgver=1.5.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Ratio-of-Uniforms Sampling for Bayesian Extreme Value Analysis"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  lapack
  r-bayesplot
  r-exdex
  r-rcpp
  r-rust
)
makedepends=(
  r-rcpparmadillo
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-ggplot2
  r-knitr
  r-microbenchmark
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f19c7af715a6a845ca9a615276bc4603')
b2sums=('19b33bcbf6dc4ab868c70ded29dbebef83e8228105dfe4e71ec6f2c5ca6605e439064c1edce92c883de892eff2a52a360e96f8eba39b96109236a3f84ebbf2be')

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
