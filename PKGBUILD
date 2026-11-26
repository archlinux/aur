# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ASURAT
_pkgver=1.18.0
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
md5sums=('f22b5b92feade613ce04607aaf8758b2')
b2sums=('8b88efdb1809026cb5293eb16772c049324b1ed13b8972bb24a855e9a4c4f271e6fba357422a76cb774f77700aaa99c225c5b62da669f18000d3bde6c2f1c3ba')

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
