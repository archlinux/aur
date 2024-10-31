# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pwalign
_pkgver=1.2.0
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
md5sums=('02e773c9593e0e9c8ce0b9b7bde3bdae')
b2sums=('2b847d741a2a70732b9adc947073ad0f970c2d56430f92becc0d006ded77fe0bac025d2b0047e0967e4cbd7ff513918e18065de5c8fdef47e82d3436de91c3e3')

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
