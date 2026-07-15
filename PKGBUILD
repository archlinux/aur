# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alabaster.matrix
_pkgver=1.12.0
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
md5sums=('0121ee8563a09299dcb7681f0655dd4f')
b2sums=('7ec1922f7d26968c1b67697d0902d68542c99ea7ab28bac44ed0d2f46f887a096ffb1df1bf51886babf80083fb8117794fcabd17c0b2032da6bfddb9ef9e8919')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

_check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
