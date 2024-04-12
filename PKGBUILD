# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CDI
_pkgver=1.0.2
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
md5sums=('64ebd520b0ba4613c3bddf06bb82dbc0')
b2sums=('05d254046c79717e813bf0c755add98e54613c342f054a6561e41c92215424204994206e69080e61d734b26d92a095bc163e8a77f82278e0a37bbfbac42a0d54')

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
