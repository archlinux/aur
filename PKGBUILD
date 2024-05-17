# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MetaboAnnotation
_pkgver=1.8.1
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
md5sums=('929653492e1e88c6af9cd32248b22b4c')
b2sums=('7cac2559e28f18dd6682571b780d3f27bd34be55419921c20f3712888528e31de8bf3db9868e9a4eb02131a58b8233720faf6eb80a44995deab526a6cdabe273')

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
