# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wasm3
pkgver=0.9.1
pkgrel=1
pkgdesc="The fastest WebAssembly interpreter and the most universal runtime"
arch=('i686' 'x86_64')
url="https://github.com/wasm3/wasm3"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/wasm3/wasm3/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('50a6b26b46648f037d58ba5ed7f1d1c48b67506cbb12e1fbe222e6c1b64a6a6e')


build() {
  cd "$pkgname-$pkgver"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

package() {
  cd "$pkgname-$pkgver"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm755 "_build/wasm3" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/wasm3"
}
