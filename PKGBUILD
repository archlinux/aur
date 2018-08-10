# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname=diamond-aligner
pkgver=0.9.22
pkgrel=1
pkgdesc="accelerated BLAST compatible local sequence aligner"
arch=('i686' 'x86_64')
url="https://github.com/bbuchfink/diamond"
license=('AGPL3')
depends=('gcc-libs' 'zlib')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bbuchfink/diamond/archive/v$pkgver.tar.gz")
md5sums=('af7a81696ac7e5bd3007614efd8470f4')

prepare() {
  # shellcheck disable=2154
  mkdir -p "$srcdir"/diamond-$pkgver/build
}

build() {
  cd "$srcdir"/diamond-$pkgver/build || exit 1

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ..

  make
}

package() {
  cd "$srcdir"/diamond-$pkgver/build || exit 1

  # shellcheck disable=2154
  make DESTDIR="$pkgdir" install
}
