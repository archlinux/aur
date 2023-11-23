# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDNAx
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Diagnostics for assessing genomic DNA contamination in RNA-seq data"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
md5sums=('ca3a7370388bf64ba5ccae7161c64ebd')
sha256sums=('4b8c512d18a57fbddfe7f4625ca00e6f6d64eab31c7871a748fec7d2446aff5d')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
