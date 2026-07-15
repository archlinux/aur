# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenomicDataCommons
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="NIH / NCI Genomic Data Commons Access"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-dplyr
  r-genomicranges
  r-httr
  r-iranges
  r-jsonlite
  r-rappdirs
  r-readr
  r-rlang
  r-tibble
  r-tidyr
  r-xml2
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocparallel
  r-biocstyle
  r-data.table
  r-dt
  r-genomicalignments
  r-ggplot2
  r-knitr
  r-listviewer
  r-maftools
  r-r.utils
  r-rmarkdown
  r-rsamtools
  r-testthat
  r-txdb.hsapiens.ucsc.hg38.knowngene
  r-variantannotation
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e3e31cca4bcc20811e9068d3fd5e83e2')
b2sums=('b5e563c2693ce7eee41767f88fc7fb02e47f70a350269b8a7e133577a4dc32af5fb785d4c51e803e1020fda5aea0184e628e7934f5dea65877691fe3c15687a1')

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
