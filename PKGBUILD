# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tomoseqr
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R Package for Analyzing Tomo-seq Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-animation
  r-biocfilecache
  r-dplyr
  r-ggplot2
  r-plotly
  r-purrr
  r-readr
  r-shiny
  r-stringr
  r-tibble
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9b74d846ca2832374ab9567717255cfc')
b2sums=('d1bb6166e8b93b6c2dbddf27bda5365af0156b713a256820cc81cbe3c74e190a16f375b25fdaaf805efcee8579703afd929de34eebf282bddc2010c607b3c90f')

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
