# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MuData
_pkgver=1.12.0
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
md5sums=('e6e4e41f2f10f08177a3d108f8431217')
b2sums=('f1898b80e16ee783775dbdeac6767939f353203a1f0b9d212635969b679fc3c6e924368b93c430bccc33aa3f382b5caa7f9d1690e31614a593c7ff8ec6a96511')

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
