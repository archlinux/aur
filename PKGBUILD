# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=VariantAnnotation
_pkgver=1.48.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Annotation of Genetic Variants"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  bzip2
  curl
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-dbi
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-matrixgenerics
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-summarizedexperiment
  r-xvector
  r-zlibbioc
  xz
  zlib
)
makedepends=(
  r-rhtslib
)
optdepends=(
  r-annotationhub
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-ggplot2
  r-knitr
  r-polyphen.hsapiens.dbsnp131
  r-runit
  r-sift.hsapiens.dbsnp132
  r-sift.hsapiens.dbsnp137
  r-snplocs.hsapiens.dbsnp144.grch37
  r-snpstats
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-build.patch")
md5sums=('39b6f4907fe37495a903c338e6d4cc73'
         '9a9acb445d97cd04129e3d6e18d54dbc')
b2sums=('16d91d43c8b0119e796590459aa9d2dc500794d94bbdbce26473c0d1fa2d1a3f278c7baaa8ca904b53391abd9558a8b92995173d3a713bccd3d4fd30d58ca820'
        'eb2767ae6affa5b5a5888adaabebdaa2588d89fb2c6f6aa461b8a0dd7cfb64fc1919a844ac27ef4a1b8c84744e4890584667e78ce7fd001d8a7411c83fee033f')

prepare() {
  # fix format string errors
  patch -Np1 -i fix-build.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
