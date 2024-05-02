# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MuData
_pkgver=1.8.0
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
md5sums=('a9ef1fa818736db9f5456923f7816309')
b2sums=('94b7b0de523cea7fe2420e27c2f4787a1a3e531a3f183d12d081cf43c8fe09da2ee3c602abfc97268541f408b9c90b469a8da9c1d54ab54000bfaaf55f54a978')

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
