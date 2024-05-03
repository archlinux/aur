# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CDI
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Clustering Deviation Index (CDI)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-ggplot2
  r-ggsci
  r-matrixstats
  r-reshape2
  r-seurat
  r-seuratobject
  r-singlecellexperiment
  r-summarizedexperiment
)
checkdepends=(
  r-biocgenerics
  r-runit
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-magick
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('61d85e8436c451a024557f91f59b63cc')
b2sums=('70c20499bbc3f250367244a22a6c0e95b20a5afe3fa11ebe89ac14ef384531259851154dd635b6455ce3d573fdbc8b2a4c1c2c7c3ede628079900798038e364b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
