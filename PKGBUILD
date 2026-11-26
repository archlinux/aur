# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alabaster.matrix
_pkgver=1.14.0
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
  r-scrapper
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a78c09017eea73716f27c484251a1d45')
b2sums=('447e7ebf9778121244de3a3ccadf0ff90313d5bc954ed632d66feb077f7ed806cf75d2ad5ca086a4d4de887d775ec44abb392b442df75d1f1f81b536eb5f5a7b')

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
