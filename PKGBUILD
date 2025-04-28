# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=factR
_pkgver=1.10.0
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
md5sums=('9afef815422a90c326be5b5c1e581e1e')
b2sums=('95659bc18795b52aba22d6bdab892412b11f7fcdccd22d190b4ecc1428441d647c492bc27412a1864d2aa8df37d41a3f297a02ea334d9e4383fcc50a1a8461c5')

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
