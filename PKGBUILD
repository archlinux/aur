# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=raer
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="RNA editing tools in R"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
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
  r-seqinfo
  r-singlecellexperiment
  r-summarizedexperiment
  bzip2
  curl
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
md5sums=('023888385d5e863b23723fd056563851')
b2sums=('58006eb879fa182ed32068e818b963067790aa4b28de6c4d1358d30d4c761754aa2ea099588deed1ee80bb5bc761daa4be7230b377764d73eaf12f7bb95588c3')

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
