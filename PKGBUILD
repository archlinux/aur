# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alabaster.matrix
_pkgver=1.4.2
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
md5sums=('3782437cde78476758f0995332fce928')
b2sums=('e62f51ff034b00e06517e0a40ae2ab7c8480ece22cb2492035f70ec3b2c76a97c720267eae6880d225e28a2d4938e4f629fd87f9b8063d7e70b1734899ca8912')

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
