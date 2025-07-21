# Maintainer: Sergey Pestov <pestov-sa@ya.ru>
pkgname=tdlib-td
pkgver=1.8.51
pkgrel=1
pkgdesc="Cross-platform library for building Telegram clients"
arch=('x86_64')
url="https://github.com/tdlib/td"
license=('Boost')
depends=('openssl' 'zlib')
makedepends=('git' 'cmake' 'gperf' 'make' 'gcc')
source=("git+https://github.com/tdlib/td.git#commit=bb474a201baa798784d696d2d9d762a9d2807f96")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/td"
}

build() {
  cd "$srcdir/td"
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/td/build"
  install -Dm644 "libtdjson.so" "$pkgdir/usr/lib/libtdjson.so"
  install -Dm644 "libtdjson.so.$pkgver" "$pkgdir/usr/lib/libtdjson.so.$pkgver"
}
