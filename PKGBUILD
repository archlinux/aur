# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BiocFHIR
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Illustration of FHIR ingestion and transformation using R"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
md5sums=('788951417cde10ad9434dd443db47f80')
sha256sums=('7c181c170fc085c884ec4b1bc4a53cd402e18c2a99691a2ce5feb7799827d7eb')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla test.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
