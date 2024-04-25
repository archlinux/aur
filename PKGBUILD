# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=chandwich
_pkgver=1.1.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Chandler-Bate Sandwich Loglikelihood Adjustment"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-numderiv
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-sandwich
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7fe64112018a8c718178ac2f36490c33')
b2sums=('02affbe11474c1947367fd63f5c8149f2f4720222dcd36691e2e67e301600774010189e940685c7fb60b5731230dea0b50077457598a755beb1f8174046a16dc')

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
