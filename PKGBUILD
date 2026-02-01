# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggstats
_pkgver=0.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Extension to 'ggplot2' for Plotting Stats"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-cli
  r-dplyr
  r-forcats
  r-ggplot2
  r-lifecycle
  r-patchwork
  r-purrr
  r-rlang
  r-scales
  r-stringr
  r-tidyr
)
checkdepends=(
  r-betareg
  r-broom
  r-broom.helpers
  r-emmeans
  r-parameters
  r-pscl
  r-reshape
  r-survey
  r-testthat
  r-vdiffr
)
optdepends=(
  r-betareg
  r-broom
  r-broom.helpers
  r-emmeans
  r-glue
  r-gtsummary
  r-knitr
  r-labelled
  r-parameters
  r-pscl
  r-reshape
  r-rmarkdown
  r-spelling
  r-survey
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b163cfddf5cf8a0143a9b29d587f032f')
b2sums=('508a206c581426e346694e71a1b75b31e857804c79d636f873be05c9a93b8067891e8f19a0137a8db2b8521c2fc2e0b2e2b8a9b9714431220b093af05d6ec8c1')

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
