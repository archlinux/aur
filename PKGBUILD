# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pwalign
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Perform pairwise sequence alignments"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-biostrings
  r-iranges
  r-s4vectors
)
makedepends=(
  r-xvector
)
checkdepends=(
  r-runit
)
optdepends=(
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b2014fb32f770ee6b56687a71e98be56')
b2sums=('71d283ec7c1df0a8051acab5833b04d72434543b1c39fec515efbd1e651dcff26da583939ff7fc3d1f3915a20b09da075f7667aacc17b353bf7cc4b99d54c301')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla run_unitTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
