# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=doMC
_pkgver=1.3.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Foreach Parallel Adaptor for 'parallel'"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL2)
depends=(
  r-foreach
  r-iterators
)
checkdepends=(
  r-runit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f4b5a3b66e1b1d6f216c290e552fe4a7')
sha256sums=('b2186f851448251ae6af5d14b9e3e7f9221f90887e5f8de6a68c91caf16619a3')

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
