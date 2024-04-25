# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tomoseqr
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('b881e4b272396cc4696d840658ec0ef5')
b2sums=('440a910d3c73adcdbaff923feb8ad006444895bc693022ee22b0164da8cceadf1cee658d41e7e01e9b0d669767334f8eaf096d5a2019fbb3fff838e72feb1e6f')

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
