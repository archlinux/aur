# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Statial
_pkgver=1.4.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="A package to identify changes in cell state relative to spatial associations"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-concaveman
  r-data.table
  r-dplyr
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
md5sums=('e7151f23bb952401803e4d239390c210')
b2sums=('3676b8cfa9ce94502550a7f32d4f404f2a42a8bcb9356920911b87544c18fcdf404188371a9f3ec61fdc34dad0972a403af83173fd3aa5d248d7f7f9498a4df2')

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
