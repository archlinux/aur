# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenomicDataCommons
_pkgver=1.28.2
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
  r-magrittr
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
md5sums=('6d6759e675b94f49938c1a7ae741ce47')
b2sums=('71a59742e510a17d9b2dd0de9c84e21e12f72b732738d76dbc69bd45910ba7566030bdf630f3ffb6611beb328faf05e5240cede25f5d62c6ab150210e03045b3')

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
