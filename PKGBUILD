# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=flowGate
_pkgver=1.12.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interactive Cytometry Gating in R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocmanager
  r-dplyr
  r-flowcore
  r-flowworkspace
  r-ggcyto
  r-ggplot2
  r-purrr
  r-rlang
  r-shiny
  r-tibble
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-stringr
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b12d8ceeb488381dd8bd0729ead344c1')
b2sums=('1d9292f405aec37230df7a01ada6c96a379ab231705731c110f7c8cc7d6d38867b2ab94b5c6696ad48fbef68b206b6088aa937747881b829b2ff37a6fe57a312')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
