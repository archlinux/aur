# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDNAx
_pkgver=1.2.1
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
md5sums=('dc325ba329126934b0850a4380af483d')
b2sums=('91c02ec63029ae9c408beae9fe164e476564d7933aadb6378bf9272ecc4c7827340c08a0d4a37bca4d9b6cb60d78cd8aa3ef396815f6c5c42ddc41d27d28dc56')

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
