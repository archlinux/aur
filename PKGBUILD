# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alabaster.matrix
_pkgver=1.4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Load and Save Artifacts from File"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-alabaster.base
  r-biocgenerics
  r-delayedarray
  r-hdf5array
  r-rcpp
  r-rhdf5
  r-s4arrays
  r-s4vectors
  r-sparsearray
)
checkdepends=(
  r-biocsingular
  r-chihaya
  r-residualmatrix
  r-testthat
)
optdepends=(
  r-biocsingular
  r-biocstyle
  r-chihaya
  r-knitr
  r-residualmatrix
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0bf0bc01bd3b0178d9db7221f88353d0')
b2sums=('648988e1825a4e004f75b18a8c5efb05da06d27897e257e36acf1577ee85ee5e0d81974afa1f354b6c4f0124c090282d4ff0db68cc627347e32d06412500285b')

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
