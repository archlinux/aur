# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pwalign
_pkgver=1.0.0
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
md5sums=('6c55f043ee827d70a7992b8fa85c43f2')
b2sums=('96cd3c929dac7de03e5cc56ee4301aa587db94dc6aeaef4d30aaf406f53363b22be1548cd5daa918d67d3299a5cb3730803e47086f9f2a59a20c32c492ccc1e0')

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
