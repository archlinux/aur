# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=oligo
_pkgver=1.70.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
  r-dbi
  r-ff
  r-oligoclasses
  r-preprocesscore
  r-rsqlite
  r-zlibbioc
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
  "fix-implicit-fun.patch::https://github.com/benilton/oligo/commit/b24d8b0e.patch"
)
md5sums=('1f05e33230872ae68b45361fea42e97c'
         'd28e79c36d0a0aeedf1a954dbfcd99fe')
b2sums=('f0b11e32bbf849816363c33e98a03140999e037bef9c013a45b301799fe05272abcbe2107ed1c3035cd8367817a3e888ab676d83d2697ef422edd5391e64541e'
        '2b137f5ff851fb7e2589d7712030c48e8037ab16f9218ceaad9d2639deec06c79f2e0765409878c33d7daced87e0407b7180401b66f83b4ae6cfc17b29d44b2f')
prepare() {
  cd "$srcdir/$_pkgname"
  patch -np 1 -R <$srcdir/fix-implicit-fun.patch
}
build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
