# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alabaster.spatial
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Save and Load Spatial 'Omics Data to/from File"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-alabaster.base
  r-alabaster.sce
  r-rhdf5
  r-s4vectors
  r-spatialexperiment
)
checkdepends=(
  r-digest
  r-dropletutils
  r-png
  r-testthat
)
optdepends=(
  r-biocstyle
  r-digest
  r-dropletutils
  r-knitr
  r-magick
  r-png
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('15936554d3260b00c33abb65b84ce911')
b2sums=('26cc6267eace413b28ce71d66dc94e24c117118d0f66264a7403a6d11c4a88369542214040a9983190c02555707df24d1b3d6848d6f3232daa3378a41b533e4b')

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
