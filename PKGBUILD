# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alabaster.matrix
_pkgver=1.6.1
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
md5sums=('267132d3e3c59086b32db98044946d97')
b2sums=('2712a3afd22b7f9a8c9ad2d2c5bfcd9c4ec24b95ac9587f4cbbd15d58556ea5845757a0a3579004e6a6ae61353b24893c93110e72788a846b1c3e6f86fcfa035')

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
