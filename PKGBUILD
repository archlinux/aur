# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rtracklayer
_pkgver=1.72.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R interface to genome annotation files and the UCSC genome browser"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0 AND LicenseRef-rtracklayer')
depends=(
  r-biocgenerics
  r-biocio
  r-biostrings
  r-curl
  r-genomicalignments
  r-genomicranges
  r-httr
  r-iranges
  r-restfulr
  r-rsamtools
  r-s4vectors
  r-seqinfo
  r-xml
  r-xvector
  curl
  openssl
  zlib
)
optdepends=(
  r-bsgenome
  r-bsgenome.hsapiens.ucsc.hg19
  r-genefilter
  r-genomeinfodb
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
md5sums=('f5ec8a266f6b044f791b5783734b74af')
b2sums=('ba03e31aa5afe8237e06ef3c28ecc67b02447b06a065f64aa83021795610954e6bbd46080d86fe74bcf973791f9673aab580e94d51eb196e58aacb2cd87304f9')

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
