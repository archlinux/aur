# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=estimatr
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast Estimators for Design-Based Inference"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
depends=(
  r-formula
  r-generics
  r-rcpp
  r-rlang
)
makedepends=(
  r-rcppeigen
)
checkdepends=(
  r-aer
  r-car
  r-clubsandwich
  r-emmeans
  r-fabricatr
  r-margins
  r-randomizr
  r-sandwich
  r-stargazer
  r-testthat
)
optdepends=(
  r-aer
  r-car
  r-clubsandwich
  r-emmeans
  r-estimability
  r-fabricatr
  r-margins
  r-modelsummary
  r-prediction
  r-randomizr
  r-rcppeigen
  r-sandwich
  r-stargazer
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c8e716d7894d9febfca19b2e8fdfea36')
sha256sums=('a9c8ce7a7f77d4e030052cced599e41376a91de8179e12dd79a5bf4eed91a9df')

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
