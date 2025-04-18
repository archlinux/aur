# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pwalign
_pkgver=1.4.0
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
md5sums=('d2d93512406dd4f34b29639020af6c7b')
b2sums=('b4dde0498e92f310998099f0207d338f64ade6ac14045bae369c454f8718d38f42b2046c6e5aaf0e89ec15701e485f7a60c2ab04f69fed616d07f1a8de1dfbc1')

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
