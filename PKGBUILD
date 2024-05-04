# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alabaster.spatial
_pkgver=1.4.0
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
md5sums=('01c601e84e24d5aaabaa621b927b09e2')
b2sums=('ca0bb70d90908e5f5e0d1bdeb0fad190325eeb216c200fbc76c1d7efcc184e87d883456c2133b6232a1c1166f3b7f9f2509dadd9397ae17fe57daf00fc3d106e')

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
