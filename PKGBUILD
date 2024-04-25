# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=nonnest2
_pkgver=0.5-6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
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
md5sums=('404b9edab7bb21841bd359fdfc2c5c82')
b2sums=('af58375640612ccb0fb847ed813f23697279310b2fcf31b7a94af6266fb9be8bb2804f56a3c7c505c892a4e54818d1316acd5546ec54849b68752406ba2c1da4')

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
