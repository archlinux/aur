# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=chihaya
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Save Delayed Operations to a HDF5 File"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
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
b2sums=('fef1766391d07684bb7968c2123ad3646bffde3cf85d3e9b1464fa92bc83d4261f2b4326a2ec27bb64a3b45529002f96f1e28fc4dadc44272d619da36f0ad92e')

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
