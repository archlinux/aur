# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=raer
_pkgver=1.2.0
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
md5sums=('5d4a84abe3ffb879560d098a51e6c21e')
b2sums=('ad54ccd4d31dc8c699b4a1e15f518c50db6cde5f70688b69eec858c30abac4aa3b800edf44982964a23055dcb1efe1909d580c13e7cb155f16cc930b4bd9dcaa')

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
