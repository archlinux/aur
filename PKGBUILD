# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SUITOR
_pkgver=1.14.0
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
md5sums=('9d0e440e7be80f035ac117a3e0d912a0')
b2sums=('1f1986cb86ac46e9ad98ae760f33e97c88e142ebceb3c049886a814bb796952a5c3b02cbb31f6e808a9782fffd09ede6ac364053878588de18b0cf12f88748a4')

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
