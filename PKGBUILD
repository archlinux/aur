# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rtracklayer
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="R interface to genome annotation files and the UCSC genome browser"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0 AND LicenseRef-rtracklayer')
depends=(
  openssl
  r-biocgenerics
  r-biocio
  r-biostrings
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-iranges
  r-rcurl
  r-restfulr
  r-rsamtools
  r-s4vectors
  r-xml
  r-xvector
  r-zlibbioc
  zlib
)
optdepends=(
  r-bsgenome
  r-bsgenome.hsapiens.ucsc.hg19
  r-genefilter
  r-genomicfeatures
  r-hgu133plus2.db
  r-humanstemcell
  r-limma
  r-microrna
  r-org.hs.eg.db
  r-runit
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "$_pkgname-fix-format.patch::https://github.com/lawremi/rtracklayer/commit/86407bbef2d02455053b7b7c96afe9c5ce6949e7.patch")
md5sums=('a16a9ca02e49808b38823899860abdb6'
         '21d1f10d3fc8764eda00651f1318e119')
b2sums=('720a430ebeefa578905ab1e2ab20f6e17c7d58c2e4cff98313ba78dbbb81132c7f05632894ca57e8f65f553bedd8253d45f7a571a8cf2d6c8f96da7cba6ba917'
        '93a6ea0626d428a2ef43ec110c526057b1fcc80925e150f4d0d10846c534eb508c11b265e5fa6cd60a16a91665a58ac204cceefb8ae9c41bf2f03f6b02b2544b')

prepare() {
  # fix format string errors
  patch -Np1 -d "$_pkgname" < "$_pkgname-fix-format.patch"
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
