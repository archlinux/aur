# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=flowGate
_pkgver=1.6.0
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
md5sums=('6839d6a9ee70a9095f5c78417d5e1c4a')
b2sums=('661e23b94273a16fc27ebdfb8c5d6d5c226b13e1eb7c8ffe909ab5ace06332d8d93e007f2659715b3985d67cd330fddc14b8a4584e4b926f541cceaac0e824ec')

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
