# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=oligo
_pkgver=1.78.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Preprocessing tools for oligonucleotide arrays"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r-affxparser
  r-affyio
  r-biobase
  r-biocgenerics
  r-biostrings
  r-bit
  r-dbi
  r-ff
  r-oligoclasses
  r-preprocesscore
  r-rsqlite
  zlib
)
optdepends=(
  r-acme
  r-annotationdbi
  r-biocstyle
  r-biomart
  r-bsgenome.hsapiens.ucsc.hg18
  r-genefilter
  r-hapmap100kxba
  r-knitr
  r-limma
  r-maqcexpression4plex
  r-oligodata
  r-pd.hg.u95av2
  r-pd.hg18.60mer.expr
  r-pd.huex.1.0.st.v2
  r-pd.hugene.1.0.st.v1
  r-pd.mapping50k.xba240
  r-rcolorbrewer
  r-rcurl
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
#  "fix-implicit-fun.patch::https://github.com/benilton/oligo/commit/b24d8b0e.patch"
)
md5sums=('16d5f22977227ff3f7cdba27941b09f9')
b2sums=('037844e1f092870ae183d932493f274b6c4045e0c15130635e276480a0671b67147d37aab678d3cb448b797fe0936ab7ceead0662354e9ffc4364e3a2e07cf53')
#         'd28e79c36d0a0aeedf1a954dbfcd99fe')
#        '2b137f5ff851fb7e2589d7712030c48e8037ab16f9218ceaad9d2639deec06c79f2e0765409878c33d7daced87e0407b7180401b66f83b4ae6cfc17b29d44b2f')
#prepare() {
#  cd "$srcdir/$_pkgname"
#  patch -np 1 -R <$srcdir/fix-implicit-fun.patch
#}
build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
