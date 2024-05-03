# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=factR
_pkgver=1.6.0
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
md5sums=('71444320c46af980fffd92815ed30e84')
b2sums=('a3ac343c955a2b8b5a5fbc367c655baeb10af39083fce20ebba202136f7ed5467609aaf7d22f183004924346e98db517a5a6559f4e9af039897d3fb2b9646aa0')

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
