# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SCArray.sat
_pkgver=1.6.0
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
md5sums=('a4fd7f15216b7396071b90d9cfb3b91b')
b2sums=('91dc11f5912c07e42b9a9b6ed559f11248ba742317277d7abfb3cd27595af71780fbd6c02cb0535458ec05da13f9c317a8b789977833b4906acb40368234afa7')

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
