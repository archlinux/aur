# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MuData
_pkgver=1.10.0
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
md5sums=('110a67684c75c4825fefd5a6e40e6983')
b2sums=('ee732ffdf588ae83cab15ed6baa6e0b5ae9f2d32c0988a9c8199d7160823638b1f54595ae0a01ba78d79019ee0df9db7c12d1d3fc4a6d56101558b0871c1cb09')

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
