# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MuData
_pkgver=1.16.1
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
md5sums=('b33ef69e2aaa4e6c856d29f0db5ad9d2')
b2sums=('5b5364e99cc20cf8fb33f05a0afe5c9fd383d7c9ed25f66a282406daf1d81d0c91fbd9bee37ac247e6f117c401af79de3ebe85c607e1d647970f3a92780482d6')

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
