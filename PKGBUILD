# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=factR
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('55b088d84e382a7068b40062151e4bec')
b2sums=('e43f33fa31399ff1a79303020f3c057c9164dc35c76e9d400702d606011c8e8d73a19c4f15d3ed90638304d58ea0458fe1cece807953ea1d4a49789af2ea77a5')

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
