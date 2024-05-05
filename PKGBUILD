# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=nipals
_pkgver=0.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Principal Components Analysis using NIPALS or Weighted EMPCA, with Gram-Schmidt Orthogonalization"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5fd148499e1c906423ee3eec530ff079')
b2sums=('bf9f3b7acbeecfe797264133fefdf271ebae6de8be65fe490efd0bd3ebe75e093a540dbf1587a5b2d2687b31e4148ca5c71c1bb3e94cd2c5463b23d8a841cc3c')

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
