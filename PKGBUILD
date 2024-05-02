# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BiocFHIR
_pkgver=1.6.0
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
md5sums=('0b27e2966794988b365a92fc705100bf')
b2sums=('dca628d107471745521a826cc164aa9f6b6ed65adbed9cb9cd06da986244a43a916471b17155ced544db3fd5b3ab49d6b98c9d003dbdbbe57381802a2ca69815')

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
