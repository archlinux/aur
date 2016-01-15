# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libxxhash
pkgver=0.5.0
pkgrel=1
pkgdesc="Extremely fast non-cryptographic hash algorithm (library)"
arch=('i686' 'x86_64')
makedepends=('cmake' 'make')
url="https://cyan4973.github.io/xxHash/"
license=('BSD')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/Cyan4973/xxHash/tar.gz/v$pkgver)
sha256sums=('9605cd18d40d798eb1262bc0c2a154e1a3c138a6a9a0c4c792e855d0c08c23e1')

build() {
  cd "$srcdir/xxHash-$pkgver"

  msg2 'Building...'
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../cmake_unofficial/
  make all
}

package() {
  cd "$srcdir/xxHash-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/libxxhash"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install -C build/
}
