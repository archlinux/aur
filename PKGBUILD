# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CDI
_pkgver=1.4.0
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
md5sums=('19e4c824c0177090307638f483e15173')
b2sums=('37c44cb38a0401705b79f7ae51093bbf8138198d553abe2850354add383342777454ba7872b3effd87938446ce165e5170afc29ebbf554659cf2f44a86f81dc3')

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
