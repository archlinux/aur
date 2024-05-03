# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SCArray.sat
_pkgver=1.4.0
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
md5sums=('d4b0240454c68414b40c35b70d51f85d')
b2sums=('e1382f5e4ecbd1b82ad507cd1cf23f2526d4292665da0e3fecf56e9af7ecccbeb76298adda584124ceca158b633c0044633d60a9d34580a156eb9b206bd58f66')

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
