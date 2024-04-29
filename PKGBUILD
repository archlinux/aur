# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MetaboAnnotation
_pkgver=1.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('fee181fc1795a1e2bde1d1e551f1a45e')
b2sums=('795945384861f3a99f2a2598799d77411cd144b9f9b883a63cf984ec1541e068b626183502fd8c4a50afec2ef78ff9a2cfa1d889eb0a0858d69948918e7f467a')

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
