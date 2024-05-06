# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=nonnest2
_pkgver=0.5-7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tests of Non-Nested Models"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
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
md5sums=('6840120e8536dc44ffdcfe779c71c7da')
b2sums=('db3bc2b1888a111598394d641b1568a91523fd4553e6b73e9846b6fab7dbb53fa7c14b84672af90ef1092315cef04ae3f420686a23577b57c1ef6b928c53a47d')

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
