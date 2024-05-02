# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rtracklayer
_pkgver=1.64.0
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
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('244c1ee304157345abf9c0fd4dbb826f')
b2sums=('25d59d580d0f110997623189349b02e843500161dccdf0fff8af65b68f0b7578e5611fc407829e7bc3adc6395974d3c7a02f09edffcc73cdf2a3050fb5f80c23')

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
