# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=simona
_pkgver=1.12.0
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
  r-fastmatch
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
md5sums=('de7bcf157e9bf6dae7a76bb91f2a6f3e')
b2sums=('ab5a3be0ed6a98e01dc9f984ab2e9c9037a092703a5a25ecc1513672a91476ba2375ede97bc71aa55bb35ebc5ec28e942c275c5bb4416bf36a920332d71b6d62')

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
