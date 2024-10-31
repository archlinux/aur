# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tomoseqr
_pkgver=1.10.0
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
md5sums=('103b5393aaa6ab1dc037f20f36ae9d5f')
b2sums=('905951aca786b3717243c45e2212e3c5c0db9ab2a4f4d0afdb74bcc248912aa3924def73f32774dfb7b48c104e0fff4d76e7cb92269fca92b51e7c9fbb4591a6')

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
