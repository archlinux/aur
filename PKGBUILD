# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SVMDO
_pkgver=1.2.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identification of Tumor-Discriminating mRNA Signatures via Support Vector Machines Supported by Disease Ontology"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=(GPL3)
depends=(
  r-annotationdbi
  r-bsda
  r-caret
  r-catools
  r-data.table
  r-dose
  r-dplyr
  r-e1071
  r-golem
  r-klar
  r-nortest
  r-org.hs.eg.db
  r-shiny
  r-shinyfiles
  r-shinytitle
  r-sjmisc
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5defbad1ecee04aa756aa24d9c93478b')
b2sums=('b9321ec70aff17371a77adadb37da8c7d4ab8fc054b6f7cd5d8c8de1ae9ca8a3655c6a1d016201abf3e85268bac41df461f0a9651c59140d6fc695dff833498c')

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
