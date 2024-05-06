# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Moonlight2R
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identify oncogenes and tumor suppressor genes from omics data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-annotationhub
  r-biobase
  r-biocgenerics
  r-circlize
  r-clusterprofiler
  r-complexheatmap
  r-doparallel
  r-dose
  r-dplyr
  r-easypubmed
  r-epimix
  r-experimenthub
  r-foreach
  r-fuzzyjoin
  r-genomicranges
  r-geoquery
  r-ggplot2
  r-gplots
  r-hiver
  r-magrittr
  r-org.hs.eg.db
  r-parmigene
  r-purrr
  r-qpdf
  r-randomforest
  r-rcolorbrewer
  r-readr
  r-rismed
  r-rtracklayer
  r-seqminer
  r-stringr
  r-tibble
  r-tidyheatmap
  r-tidyr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-devtools
  r-knitr
  r-png
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b0dd4a005ee752f5d6113ebca14602d6')
b2sums=('753e299bdc12b8becc409554c89d42419ddac99fc37285610e89b89902209fdb3052d0c8b3f21f1058dfd281ab6a826ee82198188cc536ff877e905bb392020d')

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
