# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=doMC
_pkgver=1.3.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Foreach Parallel Adaptor for 'parallel'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-foreach
  r-iterators
)
checkdepends=(
  r-runit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f4b5a3b66e1b1d6f216c290e552fe4a7')
b2sums=('adc0067583d76daed8bda9088653a0912e6d6181619a7974facc7b06aa1c0b619f6600505f4eab42fabf458073668be388b34ed37d316b03e3acb17b501101f2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla doRUnit.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
