# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MuData
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Serialization for MultiAssayExperiment Objects"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-delayedarray
  r-multiassayexperiment
  r-rhdf5
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
)
checkdepends=(
  r-hdf5array
  r-testthat
)
optdepends=(
  r-biocstyle
  r-citefuse
  r-covr
  r-fs
  r-hdf5array
  r-knitr
  r-rmarkdown
  r-scater
  r-singlecellmultimodal
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2dfa5e65c539e0f91357c893f132149c')
b2sums=('1a14259407ccb74478f0bada5edffc18c4d232f602606d00b02a6f070ee98e0bdb2d97417fd0a1b77450e1a83259be4f55399f1663fdbbde06606e1548e58da6')

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
