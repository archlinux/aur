# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=raer
_pkgver=1.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="RNA editing tools in R"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  curl
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-cli
  r-data.table
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-r.utils
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
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
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('da2d27f76962c7d534f36f05815670d3')
b2sums=('0079593d5d24b9500788c10e025364972d4d8d0f8eede7ee58a8ace5e9bb0d2f83cdbe89b377936bb855c0302662c82c340a3026ba82266034c380578021a1fa')

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
