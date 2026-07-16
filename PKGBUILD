# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=simpleSeg
_pkgver=1.14.0
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
md5sums=('b09374166775ed69ab7888019ce0f74b')
b2sums=('76581b0596ad217ce67b06bf4bb1f780684b3dfdbfd46aadc8dc5cdacf136b82c2ca29348ad16d1f8b04801130ea36d5e6dea47d796b2881413fb2c1d6c5e87a')

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
