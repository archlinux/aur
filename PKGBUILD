# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Moonlight2R
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Identify oncogenes and tumor suppressor genes from omics data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
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
b2sums=('13fe521f228ce42b6693125e36e246bd09281441dc90224f891cb4e87866b94fb8ef40b6ea0ab2569bf6fa66efb16dfd55df517a3d2abde41abbdda881f4eb48')

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
