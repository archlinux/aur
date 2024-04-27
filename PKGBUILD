# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ASURAT
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Functional annotation-driven unsupervised clustering for single-cell data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-circlize
  r-complexheatmap
  r-plot3d
  r-rcpp
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-annotationdbi
  r-biocgenerics
  r-dplyr
  r-ggplot2
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
  r-rtsne
  r-seurat
  r-stringr
  r-tenxpbmcdata
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a1cb615f6ddab8cb8b9ccb1a73ba39de')
b2sums=('3621bfbabf70134b2ce0e0e4cee825dd342dcb13a4c017c07ae5aea683c997dfce91f5a0f622215ed1011d930e156b46f451cec1e737648e0f8faa5adcd884f8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
