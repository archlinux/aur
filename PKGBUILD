# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=chihaya
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Save Delayed Operations to a HDF5 File"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-delayedarray
  r-hdf5array
  r-rcpp
  r-rhdf5
  zlib
)
makedepends=(
  r-rhdf5lib
)
checkdepends=(
  r-biocsingular
  r-residualmatrix
  r-testthat
)
optdepends=(
  r-biocgenerics
  r-biocsingular
  r-biocstyle
  r-knitr
  r-residualmatrix
  r-rmarkdown
  r-s4vectors
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fc8e24fa8ec373d01c938fbfe12c3b9a')
sha256sums=('f193f2c53109a931b6a44f8931e6ba6dc463ae180c452d1b6d137d32e13de255')

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
