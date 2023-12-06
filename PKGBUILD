# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SUITOR
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Selecting the number of mutational signatures through cross-validation"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL2)
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
md5sums=('5f4a5ea607ef7551025cf8b425d20bc7')
sha256sums=('dcf836310ea9e773861574bf10dd01f88dc648c9679d59c6d1dcf13f9d46102b')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
