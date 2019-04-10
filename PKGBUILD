# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname=diamond-aligner
pkgver=0.9.24
pkgrel=1
pkgdesc="accelerated BLAST compatible local sequence aligner"
arch=('i686' 'x86_64')
url="https://github.com/bbuchfink/diamond"
license=('AGPL3')
depends=('gcc-libs' 'zlib')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bbuchfink/diamond/archive/v$pkgver.tar.gz")
md5sums=('c0db4f35a5a4be587a6654d08e436546')

prepare() {
  # shellcheck disable=2154
  mkdir -p "$srcdir"/diamond-$pkgver/build
}

build() {
  cd "$srcdir"/diamond-$pkgver/build || exit 1

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ..

  make
}

package() {
  cd "$srcdir"/diamond-$pkgver/build || exit 1

  # shellcheck disable=2154
  make DESTDIR="$pkgdir" install
}
