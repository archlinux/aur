# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SCArray.sat
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Large-scale single-cell RNA-seq data analysis using GDS files and Seurat"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocgenerics
  r-biocparallel
  r-biocsingular
  r-delayedarray
  r-gdsfmt
  r-s4vectors
  r-scarray
  r-seurat
  r-seuratobject
  r-summarizedexperiment
)
checkdepends=(
  r-runit
)
optdepends=(
  r-biocstyle
  r-future
  r-knitr
  r-markdown
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8af33d505e0c836cbdb0d901da7a0977')
b2sums=('600803c956f246db20cb53e7a24e7979202ac8395ae253685fcfbe3edc5be998a93c038757445039a8977ed345baf43d4cce32f8505d63f3592cc8f33aaf0105')

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
