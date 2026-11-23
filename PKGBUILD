# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Statial
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A package to identify changes in cell state relative to spatial associations"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-concaveman
  r-data.table
  r-dplyr
  r-edger
  r-ggplot2
  r-limma
  r-magrittr
  r-plotly
  r-purrr
  r-ranger
  r-s4vectors
  r-singlecellexperiment
  r-spatialexperiment
  r-spatstat.explore
  r-spatstat.geom
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-tidyselect
  r-treekor
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-classifyr
  r-ggsurvfit
  r-knitr
  r-lisaclust
  r-spicyr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('67e13cc0855e76ac4c4ead4e07ba630a')
b2sums=('b5611ad77e3a21ad0d4d2cd033e898c21f8757891f4c7f71dc5240d2e20c6ea7e156e5482db7b460723215beedd0572d8d6a19de6c6a4cb8992fd1045ec76dd6')

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
