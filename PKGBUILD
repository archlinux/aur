# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=simona
_pkgver=1.6.0
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
md5sums=('0ec4ab17b45b0e4e753a9e3507a76360')
b2sums=('37944f78282569739c984b1ad2e7957656d4180380af08433c973434d6a3f87facbbe59cef3b7c270327f44e3775ecf986f0a14d1b291ec72593a4a9551b6114')

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
