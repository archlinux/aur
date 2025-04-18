# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=enrichViewNet
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="From functional enrichment results to biological networks"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-dose
  r-enrichplot
  r-gprofiler2
  r-jsonlite
  r-rcy3
  r-strex
  r-stringr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-testthat
  r-magick
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('28f9156dcc2e3d0a8b8a9b94ad7ba1d4')
b2sums=('0b4b43d7fb00cc03b1f1f7e28cd458244c8f362212f5438666eaf80e51b8f7f521b7b1fc1552f7813cc2ad9b0696357ce2973ac3190c185e26970403dc49e30d')

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
