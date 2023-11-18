# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=adverSCarial
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="adverSCarial, generate and analyze the vulnerability of scRNA-seq classifiers to adversarial attacks"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
depends=(
  r-delayedarray
  r-gtools
  r-s4vectors
)
checkdepends=(
  r-biocgenerics
  r-runit
)
optdepends=(
  r-biocgenerics
  r-chetah
  r-knitr
  r-loomexperiment
  r-runit
  r-stringr
  r-tenxpbmcdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('196840790cf7fd0a0cbfe6d1aeb60e07')
sha256sums=('0a6c0c8d2d9567c14040c9be8db7f89c0704df3dd143f63bb5b71fdf6828cdfa')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
