# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ASURAT
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('982b35bc493bed92ff26988b1bd9224e')
b2sums=('94ad5972e538841cfe7ebc83a75caf293786c03afa7dd93c22b9ee057b2ce980f192e00f08c181ea64d7b7635a8e8ae07a34d22fe32a9540808bb88da9716f5f')

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
