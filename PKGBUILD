# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=unigd
_pkgver=0.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Universal Graphics Device"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  cairo
  libpng
  libtiff
  r-systemfonts
  zlib
)
makedepends=(
  r-cpp11
)
checkdepends=(
  r-fontquiver
  r-testthat
  r-xml2
)
optdepends=(
  r-covr
  r-fontquiver
  r-knitr
  r-rmarkdown
  r-testthat
  r-xml2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b175ff191262e858e7e0d16dbb8ec32b')
b2sums=('765222d10780db4a51783208544106fbb60965e2c5a25ff9dce5bd16d0d0be81ed539135869b88d3acd21d8d4c3bc4c08e356a89dfbde29d477317ae1b111ed6')

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
