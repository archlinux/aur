# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=adverSCarial
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('d4bbd762fa5b6491a9c51f822ea413c0')
b2sums=('c20ea509a4f92bd8e1bb82d9683e445d2dadf1cd510e75d1a221ea616b4fb887e78b3e0a384f726ad286b55eb04c76f4b09479cf130d3bb31d6518b5fb30bcae')

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
