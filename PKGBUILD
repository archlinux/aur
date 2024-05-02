# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=simona
_pkgver=1.2.0
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
md5sums=('2f4a9eed9ebde10c3aa703095b529994')
b2sums=('b1d3db9ea0fa0cfbf9e79f9c616087d3cc2dcf184a99999d189a2854f46b43cea11f2fa064c36cda83b48fe1582f2b2f31cfb13905b086ce300b671271a8be1c')

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
