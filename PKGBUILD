# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alabaster.spatial
_pkgver=1.6.1
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
md5sums=('5f6470882c2e1a348dcdcc20d5d672b9')
b2sums=('8bc2fb4c493e6497ab7cea2d88a5c6d64f828846bb7a199f817212103db6a682254ca217cc64b3ec7daf4fce9dc35190adea70d8cf4f70f883664c5284f0e52f')

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
