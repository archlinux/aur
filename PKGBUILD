# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MetaboAnnotation
_pkgver=1.10.0
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
md5sums=('5220af7284f5d8b782230028ba1406fe')
b2sums=('16ad758a7daaeeaf2b90eb513087cc3773d254963f1e5fef1532b6c103d04d47cba8aa212e335ffc33c76bf6dd72968336a4e1924f560acd3259122be4a53b36')

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
