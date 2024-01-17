# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=estimatr
_pkgver=1.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast Estimators for Design-Based Inference"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
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
md5sums=('0dadaa803a54e5c38c52eb478633e89f')
b2sums=('0e20bd3f756bb56f8acac859c5c1b9e31b5cbe74ac9ad801ac062e887514a1107038e6f8d53cb53a4e4e45e82a109acdea7d31cc5d676a47240f25c491694ad6')

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
