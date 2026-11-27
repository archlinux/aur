# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

_pkgname=annotate
_pkgver=1.92.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Annotation for microarrays"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-dbi
  r-httr
  r-xml
  r-xtable
)
checkdepends=(
  r-org.hs.eg.db
  r-runit
)
optdepends=(
  r-biocstyle
  r-biostrings
  r-genefilter
  r-genomicranges
  r-go.db
  r-hgu95av2.db
  r-iranges
  r-knitr
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-rae230a.db
  r-rae230aprobe
  r-rgraphviz
  r-runit
  r-tkwidgets
  r-txdb.hsapiens.ucsc.hg38.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('09ae9be724216a3681c3b3ad76af30ac')
b2sums=('26d1832faf3067c5c15aa28b038d62492e1450c7d564fc85c5d67ea2f118f11742d7f17cab608bdd8299fb505d40450fb236d02767e8a2305781a88288c20c02')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla annotate_unit_tests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
