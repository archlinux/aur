# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=factR
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Functional Annotation of Custom Transcriptomes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Apache-2.0')
depends=(
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-crayon
  r-data.table
  r-dplyr
  r-drawproteins
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-iranges
  r-pbapply
  r-purrr
  r-rcurl
  r-rlang
  r-rtracklayer
  r-s4vectors
  r-stringr
  r-tibble
  r-tidyr
  r-wiggleplotr
  r-xml
)
checkdepends=(
  r-annotationhub
  r-bsgenome.mmusculus.ucsc.mm10
  r-testthat
)
optdepends=(
  r-annotationhub
  r-bio3d
  r-bsgenome
  r-bsgenome.mmusculus.ucsc.mm10
  r-covr
  r-knitr
  r-markdown
  r-patchwork
  r-rmarkdown
  r-rmdformats
  r-signalhsmm
  r-testthat
  r-tidyverse
  r-zeallot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7398ad1642ccd6524192c11bf748a93b')
b2sums=('6cc0b18c8d7fe1b3bfe8fea33828b81de7ede4582ffb30a7ba6b2746fcb566ec42335cf6a04997dfffd6276612a6d26be9bb2222e73bfd9349f250c10560f351')

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
}
