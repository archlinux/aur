# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CDI
_pkgver=1.12.0
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
md5sums=('dd3e91e4968a71ba211e1ded5f21b908')
b2sums=('d25a7897d417623e88c27c41c4ad5f9f8686a061c40d7f92f7e9617ea2fea5ac7d4dade455b02962c281dc42e11514e2713518f9e4761ce5f1da44d92b65b542')

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
