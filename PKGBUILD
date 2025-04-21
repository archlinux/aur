# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CDI
_pkgver=1.6.0
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
md5sums=('1913e1f6490effbfd46c1c3f06219508')
b2sums=('59c2f361ee83317c092c69e11a90290c18ca1baea53e99a8fd8622e098b6328d28bddbbcac2cdf4cf508d17f4a4819bdd9cfb76564963692bdafa828b65b0c5e')

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
