# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

_pkgname=annotate
_pkgver=1.90.0
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
  r-go.db
  r-hgu95av2.db
  r-humanchrloc
  r-iranges
  r-knitr
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-rae230a.db
  r-rae230aprobe
  r-rgraphviz
  r-runit
  r-tkwidgets
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('005b6691c7fbc0a173d704dc644fc37a')
b2sums=('37e345f7a95ba6ef49392af2b6a5e6dd10da607e25889f8f8277afa91c22822f0f07e300d4b0a81c4c3e78375f1dc81bba579968cc5bd4d556b5929d882c6bdd')

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
