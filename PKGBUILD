# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BiocFHIR
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Illustration of FHIR ingestion and transformation using R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocbaseutils
  r-dplyr
  r-dt
  r-graph
  r-jsonlite
  r-shiny
  r-tidyr
  r-visnetwork
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-igraph
  r-knitr
  r-rjsoncons
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c638db36762057076b2bd5802933edbf')
b2sums=('a6db967c48b9d1f6b0a2cc8a6029d85f12c6b75892105787be1e01b64847eccc4e3ae374be1d99f55433d0230bbe8c886cb1ab1c67b2db5ebf6d9203307daf2e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla test.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
