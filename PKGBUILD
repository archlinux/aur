# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=nonnest2
_pkgver=0.5-6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tests of Non-Nested Models"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-compquadform
  r-lavaan
  r-mvtnorm
  r-sandwich
)
checkdepends=(
  r-aer
  r-faraway
  r-mlogit
  r-openmx
  r-ordinal
  r-pscl
  r-testthat
)
optdepends=(
  r-aer
  r-faraway
  r-knitr
  r-mirt
  r-mlogit
  r-openmx
  r-ordinal
  r-pscl
  r-rmarkdown
  r-testthat
  r-tidysem
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('404b9edab7bb21841bd359fdfc2c5c82')
sha256sums=('b59144f50fb264fd0d40ee770bf25047bf0f37fa154620d8fe0a91c0065061e8')

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
