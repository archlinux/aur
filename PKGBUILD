# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tomoseqr
_pkgver=1.8.0
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
md5sums=('e152b36216bf08f9c5947b678c474243')
b2sums=('e8a10675ef3de08058e393d40b95a93114cf87b699c6e9070d800f2460aebe2bc3502eae0424a8c50fdbb240dbf4accb2a4c6dfd89dec88fab7097d8c69f837a')

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
