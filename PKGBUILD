# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gatom
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Finding an Active Metabolic Module in Atom Transition Network"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-bionet
  r-data.table
  r-ggally
  r-ggplot2
  r-htmltools
  r-htmlwidgets
  r-igraph
  r-intergraph
  r-mwcsr
  r-network
  r-plyr
  r-pryr
  r-shinycyjs
  r-sna
  r-xml
)
checkdepends=(
  r-org.mm.eg.db
  r-reactome.db
  r-testthat
)
optdepends=(
  r-annotationdbi
  r-biocstyle
  r-fgsea
  r-keggrest
  r-knitr
  r-org.mm.eg.db
  r-r.utils
  r-reactome.db
  r-readr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('53c7f36266f15eca255e6c6ef3c83cc1')
b2sums=('0e489b46cc5027022075e747fd5ee047351cf50400904c2e2a3ab4bdccd433a0d22dc438d2b95532ab7366c1233205372dcba427282a98ec8679efc901320d82')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENCE" "$pkgdir/usr/share/licenses/$pkgname"
}
