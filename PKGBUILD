# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SUITOR
_pkgver=1.16.0
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
md5sums=('c303e22a4be794f858723e84fb705d03')
b2sums=('6303bf4cbbd3d4d870f700e2fc8029cc50784932369a71ff7fe608033ce18d668f5ed3ff1a8ec2eed920a2669a09e17b6525d5c28ce20df6d68b37e6191451c7')

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
