# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=unigd
_pkgver=0.1.1
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
md5sums=('37bfbf9974b65c696f687f12a21dbc6e')
b2sums=('c1891bc2fd44401acfc76d7a0efe6f46acde5223e443c06aae2a0cea5436bbb2d54844c8cb23747080454459d183ab4c15455e3aabaa3259634c5810daba4b82')

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
