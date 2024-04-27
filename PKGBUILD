# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=adverSCarial
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="generate and analyze the vulnerability of scRNA-seq classifiers to adversarial attacks"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
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
b2sums=('1af78a61eacbe48d1f96572a45c9e29d0a95604d9fe240c29a5927961e157b62f7c5a4c7efe0a1e5989dc8bf44e69701fb3d6740db7a30c6768d8746e1d3fff6')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
