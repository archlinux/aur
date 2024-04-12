# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=simona
_pkgver=1.0.10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Semantic Similarity in Bio-Ontologies"
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
md5sums=('3c9d33cfa91dc8e3e071da9fb3bff761')
b2sums=('00f3ed8cce6c401558d4e08365ac82111a00fd7e8f973b438868d58e602efe90b13d528170da13c323d16a4d6eab32ad4445938027834a068ba29c9228656b14')

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
