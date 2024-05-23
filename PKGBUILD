# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=simpleSeg
_pkgver=1.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A package to perform simple cell segmentation"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-cytomapper
  r-ebimage
  r-s4vectors
  r-spatstat.geom
  r-summarizedexperiment
  r-terra
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('25d2d8f0d36f2fd00d6fa19c1f1c06b6')
b2sums=('1e1d105f911854027910107d3c33458db0a1f6ab2683e1a89778e5db37850f396867b17c0b6b1092e286bfa06ddaf6643cb2ab56804be20e58ea1a1711e68bc2')

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
