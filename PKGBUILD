# Maintainer: Bipin Kumar <bipin@ccmb.res.in>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname=diamond
pkgver=2.1.0
pkgrel=1
pkgdesc="DIAMOND is a sequence aligner for protein and translated DNA searches, designed for high performance analysis of big sequence data https://doi.org/10.1038/s41592-021-01101-x"
arch=('x86_64')
url="https://github.com/bbuchfink/diamond"
license=('GPL3')
depends=('gcc-libs' 'zlib')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bbuchfink/diamond/archive/v$pkgver.tar.gz")
sha256sums=('5bd04574bb454562301c10b8e2594be33a147894b173421c929939b52e251715')

prepare() {
  # shellcheck disable=2154
  mkdir -p "$srcdir"/diamond-$pkgver/build
}

build() {
  cd "$srcdir"/diamond-$pkgver/build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ..

  make
}

package() {
  cd "$srcdir"/diamond-$pkgver/build

  # shellcheck disable=2154
  make DESTDIR="$pkgdir" install
}
