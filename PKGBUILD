# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=raer
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="RNA editing tools in R"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  bzip2
  curl
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-cli
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
  xz
  zlib
)
makedepends=(
  r-rhtslib
)
checkdepends=(
  r-edger
  r-testthat
)
optdepends=(
  r-annotationhub
  r-biocstyle
  r-bsgenome.hsapiens.ncbi.grch38
  r-complexheatmap
  r-covr
  r-deseq2
  r-edger
  r-knitr
  r-limma
  r-raerdata
  r-rmarkdown
  r-scater
  r-scran
  r-scuttle
  r-snplocs.hsapiens.dbsnp144.grch38
  r-testthat
  r-txdb.hsapiens.ucsc.hg38.knowngene
  r-txdbmaker
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('21a412efc0f2119b08dfa4218cb21652')
b2sums=('1081aef7cf2cc5f0204c8c68c15bfd16572e6a94f1d0a52ab7b3011fa7ad436bf7114f9771d3ed9f5274f4142207d3b6cd62ad7fc17e0bf6ee02957cb29eafc9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
