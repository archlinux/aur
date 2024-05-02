# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SUITOR
_pkgver=1.5.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Selecting the number of mutational signatures through cross-validation"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biocparallel
  r-ggplot2
)
checkdepends=(
  r-biocgenerics
  r-runit
)
optdepends=(
  r-biocgenerics
  r-biocmanager
  r-biocstyle
  r-devtools
  r-knitr
  r-mutationalpatterns
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('978dae67ed4348eb89cd491637da46b3')
b2sums=('0e1cbb0671666085a0405ee309c4ee42afee17c83e58ace8543cb7f6d08fe05ae2234dfb576908a9cd20f9846ce8a187bda0e8e9839aff522909f8eb4095e258')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
