# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SVMDO
_pkgver=1.2.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Identification of Tumor-Discriminating mRNA Signatures via Support Vector Machines Supported by Disease Ontology"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
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
md5sums=('788f1db2c52ad72905209b3dee342113')
b2sums=('bf279ba9bbec18714ca1b405520e7d890c2bbe461f5e00163f0234db56fe9c579766b211a1507f2b8ecf19ddde003fea0808444d9d25408537f24585d472732e')

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
