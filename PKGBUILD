# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SCArray.sat
_pkgver=1.2.1
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
md5sums=('dfa447cd634a432486a982a719e27451')
b2sums=('c5578e0249789ce5b09ccaf8209b12109f18c68dd37230e2c25259bcbf59eba958d99d56076b0b3d8ac12dcd48e871c0ad16cf7d9ba9933259ee89214823df54')

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
