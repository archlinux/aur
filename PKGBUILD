# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=factR
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Functional Annotation of Custom Transcriptomes"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Apache)
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
sha256sums=('bb37f5dfd3ff46d37ff4ae979b5cb6753d953372522fac7e740f3869313e99e4')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
