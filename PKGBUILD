# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BOBaFIT
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Refitting diploid region profiles using a clustering procedure"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-dplyr
  r-genomicranges
  r-ggbio
  r-ggforce
  r-ggplot2
  r-magrittr
  r-nbclust
  r-plyranges
  r-stringr
  r-tidyr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('48b9cc5c35adf6469bd1dc2ca566bed1')
b2sums=('0fdaf166aa9a8b6caf6e4a824924fa0b01ed3a4ded0f7b9e9cc5d8d97b34fb696ed858e700986b0beb115cc608aa426f4c8ceccbf0ee09ab7b5aaac77152baa8')

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
