# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDNAx
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Diagnostics for assessing genomic DNA contamination in RNA-seq data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
  r-annotationhub
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bitops
  r-cli
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicfiles
  r-genomicranges
  r-iranges
  r-matrixstats
  r-plotrix
  r-rcolorbrewer
  r-rsamtools
  r-s4vectors
  r-summarizedexperiment
)
checkdepends=(
  r-gdnainrnaseqdata
  r-runit
  r-txdb.hsapiens.ucsc.hg38.knowngene
)
optdepends=(
  r-biocstyle
  r-gdnainrnaseqdata
  r-knitr
  r-rmarkdown
  r-runit
  r-txdb.hsapiens.ucsc.hg38.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6926dccba12870cb64efe08bdeff939a')
b2sums=('d1f327822d7181adfaedab22498f4324323b100d5e66eab576b96e708d3297966cc2b0261b90b470f1ba997ca706d209ea73953781fe3129c1ec42fd2bde9e9c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
