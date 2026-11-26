# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=adverSCarial
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="generate and analyze the vulnerability of scRNA-seq classifier to adversarial attacks"
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
md5sums=('52d8fdac0131531c2e9c0168a675550d')
b2sums=('5dc88dbdf82b02c1790efac8ad0f8131ff5c486c0f1122a3b7ec3c9835cbc56263f56c6d140d0cbcaccfac707a35bb499af80e4cd037c1eed2f7087b786b3259')

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
