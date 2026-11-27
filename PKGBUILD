# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SCArray.sat
_pkgver=1.14.0
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
md5sums=('8e4043f6ba92f65c293f407c14237f46')
b2sums=('ecdd5c25058268ac69763643251a4d77814d787b04acab25e8e52bf27b00a5dbb82e098a1108861332762df9e4cd27f16e4a61a988073a86de2dc0023b5a1def')

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
