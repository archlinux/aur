# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ASURAT
_pkgver=1.8.0
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
md5sums=('4ea2abf6ca17139ec3a1d1a289ac4449')
b2sums=('6213cfeea959b72c584ba58b80fb2f69d4cf74ed085161f8d7b1c7644098693b69f982c082dd7023256475dc628cf13ce929da94923febb0f4ea20014afa020e')

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
