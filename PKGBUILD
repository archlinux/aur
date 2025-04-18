# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ASURAT
_pkgver=1.12.0
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
md5sums=('803a87b7fcff2e81f622c5177bb8edb1')
b2sums=('569a1a48f1786009352f3a8632131f4f9735eb9f033d128799032478e14876092d021c92f20c3e192289fa7e1433a11467339c565f114fab4bcce0d67b64d7ee')

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
