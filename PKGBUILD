# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=logitnorm
_pkgver=0.8.38
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Functions for the Logitnormal Distribution"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL2)
depends=(
  r
)
checkdepends=(
  r-runit
)
optdepends=(
  r-ggplot2
  r-knitr
  r-markdown
  r-reshape2
  r-runit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4a1f49249dcd7a212287a1ac6b4e1921')
sha256sums=('38f55427955625d17ea5e92267d2549f3f2a21f3c3ee228d81c181dc80d05b07')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla doRUnit.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
