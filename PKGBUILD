# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

_pkgname=annotate
_pkgver=1.86.0
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
md5sums=('06361873f725e1263c24980aa9ab3cc9')
b2sums=('3730cff19fbf4730a3ddb1aa9cceb42b6b11db99563643021a32991a3cb93e2e7e365cbb185b0103cc99dd997491d8247888af29ee9526a98d8195afce3caa25')

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
