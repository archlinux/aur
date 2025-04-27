# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDNAx
_pkgver=1.6.0
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
md5sums=('58b6b0e0ba49680b78ad87aa07856cc2')
b2sums=('0b090996be7aabf4f0bbfc659aa1368009d9b17a7ae7257d094be00d7d0c2b6cc6fbc912a28ec976c0f51e20416c3485fa06607078e029e16bfea896e684264d')

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
