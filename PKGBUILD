# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=adverSCarial
_pkgver=1.10.0
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
md5sums=('da68471d5482521a6d574b34400fb9ac')
b2sums=('2e1e8472c86a2263b02a4028e13ef8623f38d37e94a766124358182ff7be10c266e1fb8e1ff049291e1b6a4f4e0a0cbaf9e8f8151f328070c920b5bd6a1d6418')

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
