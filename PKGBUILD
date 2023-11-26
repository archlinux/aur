# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Moonlight2R
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identify oncogenes and tumor suppressor genes from omics data"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-annotationhub
  r-biobase
  r-circlize
  r-clusterprofiler
  r-complexheatmap
  r-doparallel
  r-dose
  r-dplyr
  r-easypubmed
  r-foreach
  r-fuzzyjoin
  r-genomicranges
  r-geoquery
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
md5sums=('45af1bc580f9231cb2a83eae7517d3b8')
sha256sums=('e306a3aa11700652a2f1ada4cec3eed4112ec43d3392da550538b8c4bf6ee909')

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
