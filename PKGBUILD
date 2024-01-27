# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=fenr
_pkgver=1.0.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast functional enrichment for interactive applications"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-assertthat
  r-biocfilecache
  r-biomart
  r-dplyr
  r-ggplot2
  r-httr2
  r-progress
  r-purrr
  r-readr
  r-rlang
  r-rvest
  r-shiny
  r-stringr
  r-tibble
  r-tidyr
  r-tidyselect
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
  r-topgo
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7452c5f9c400c3a3a3af9a0b26e7585e')
b2sums=('3826e7f3ac0ac8e4164880310f901e983937c7cd3b16d4796f08b7856f67e30985c1067a5744c7b1ca64b04dd42cced90ff624ae1dcc43e5fba97db647cd7bf9')

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
