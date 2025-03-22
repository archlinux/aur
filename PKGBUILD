# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Moonlight2R
_pkgver=1.4.0
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
md5sums=('96842c4ab79b82de4ee8a43d1cc10976')
b2sums=('c9220627cc0a12937a9bc3b726ac3abc2c451389267c6a88792039ea6e709016a15e679efbbee51aa550434c9b2db2eee91137019dde76c9725f46c2a371ea05')

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
