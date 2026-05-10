# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pwalign
_pkgver=1.8.0
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
md5sums=('284cea12f42e5fdb06af15c4e80a1fcc')
b2sums=('201263e6631723357874e6af67009ba1558c5d12f6423ea395354d0ad918678f06953f98ab0ffd665096a56f364ee77ac786991411051deada6bb9ddf98fad1d')

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
