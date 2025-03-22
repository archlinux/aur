# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=simona
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc='Semantic Similarity on Bio-Ontologies'
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  java-runtime
  perl
  r-circlize
  r-complexheatmap
  r-getoptlong
  r-globaloptions
  r-igraph
  r-matrixstats
  r-polychrome
  r-rcpp
  r-s4vectors
  r-shiny
  r-xml2
)
checkdepends=(
  r-go.db
  r-org.hs.eg.db
  r-proxyc
  r-testthat
)
optdepends=(
  r-annotationdbi
  r-annotationhub
  r-biocmanager
  r-diagrammer
  r-go.db
  r-interactivecomplexheatmap
  r-jsonlite
  r-knitr
  r-org.hs.eg.db
  r-png
  r-proxyc
  r-ragg
  r-simplifyenrichment
  r-testthat
  r-uniprotkeywords
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b1e954e8f591b4440136f4b60280f1d9')
b2sums=('3b4893133a37275caad0abe7341f878b244b7cd2adfa5b7de19984e159b0b80e773221002fd3b7f0e4d63cb64c8dbd4405b8476c15d619266f55dbe29837fe9a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla test-all.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
