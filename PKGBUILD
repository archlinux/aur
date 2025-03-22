# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenomicDataCommons
_pkgver=1.30.1
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
md5sums=('40258c8a1f527031e60ed2fbd8874bbd')
b2sums=('ca1a4532f8208302f5784d51c616edc7f27a17776d3314f4672f6fb1d61b7b921d1e6f36055d0959ecb8d99e4c8bc92fcac7e969b62f92ea3b33f1032d65aa68')

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
