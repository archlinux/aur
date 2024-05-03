# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MetaboAnnotation
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Utilities for Annotation of Metabolomics Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationhub
  r-biocgenerics
  r-biocparallel
  r-compounddb
  r-metabocoreutils
  r-mscoreutils
  r-protgenerics
  r-qfeatures
  r-s4vectors
  r-spectra
  r-summarizedexperiment
)
checkdepends=(
  r-msdata
  r-mzr
  r-testthat
)
optdepends=(
  r-biocstyle
  r-dt
  r-knitr
  r-microbenchmark
  r-msdata
  r-mzr
  r-plotly
  r-rmarkdown
  r-shiny
  r-shinyjs
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ed47c97fe9e6257f5b3a3ac301f14109')
b2sums=('3db944dd5db55073c65458952fb98a7f195f20f486e61e4867d784232691bff5569ed9475996b9bef80f9645ee06992df2132796805d487e16123ff194f77108')

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
