# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MNP
_pkgver=3.1-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fitting the Multinomial Probit Model"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
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
sha256sums=('4913450e88ed1ed2d048b4fdbc92e31100eb906a87f1f6ad5c45773656e2aed7')

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
