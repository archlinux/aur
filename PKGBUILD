# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

_pkgname=annotate
_pkgver=1.80.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Annotation for microarrays"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
  r-biostrings
  r-genefilter
  r-go.db
  r-hgu95av2.db
  r-humanchrloc
  r-iranges
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-rae230a.db
  r-rae230aprobe
  r-rgraphviz
  r-runit
  r-tkwidgets
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('04d25cadc03401556364f8ca9c3b2a61')
sha256sums=('4dab9615498f6c58d1e6ecc1ecd0052187e46bdf971b18d73149b6bddea2ad82')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla annotate_unit_tests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
