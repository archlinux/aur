# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MNP
_pkgver=3.1-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Fitting the Multinomial Probit Model"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  lapack
  r
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7613e5396a2a420162e9bb0959985498')
b2sums=('b14009a78654e8badac20a596010ebb277e89b2e13095ac618c1808df42ecc18d664f6cc61dea2bd7099da242cbbedab4760e9d5cae38a41b352912337061181')

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
