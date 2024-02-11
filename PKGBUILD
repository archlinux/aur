# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDNAx
_pkgver=1.0.1
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
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicfiles
  r-genomicranges
  r-iranges
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
md5sums=('4f51a23263fff85c936d0319a2c0e1de')
b2sums=('9563776d06f41efe8bd315cd2b3a16d451010e6a33f2f4dee3670c91d1f0ffdb8ecae228a4b6851d03431d1ed1930808f0899ce8dd4889ac32ef027cc5ec9bc1')

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
