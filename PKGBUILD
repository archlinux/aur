# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=chihaya
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('dcbb0f86dbec8e9a1df405fd798bc7f6')
b2sums=('4750bc874fe598b071a17d778aa9f722279079b86e437a4b2826aea91781a2ad1687de016bb61fe774c3f429b4b8c502e6fdc9bdd383c33aac672d4a7e101870')

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
