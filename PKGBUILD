# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rtracklayer
_pkgver=1.68.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R interface to genome annotation files and the UCSC genome browser"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0 AND LicenseRef-rtracklayer')
depends=(
  curl
  openssl
  r-biocgenerics
  r-biocio
  r-biostrings
  r-curl
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-httr
  r-iranges
  r-restfulr
  r-rsamtools
  r-s4vectors
  r-xml
  r-xvector
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
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5ab268c04d5423c6ad4c27ddc671c90d')
b2sums=('216916bebefca6f83b64c5819e94da6425b53069063fcf048029e5a541c4de3bca2f4839fcb37f57cab82399ed845c50fd20efb438038703662a3b100b181e70')

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
