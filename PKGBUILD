# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wasm3
pkgver=0.5.0
pkgrel=1
pkgdesc="The fastest WebAssembly interpreter and the most universal runtime"
arch=('i686' 'x86_64')
url="https://github.com/wasm3/wasm3"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/wasm3/wasm3/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b778dd72ee2251f4fe9e2666ee3fe1c26f06f517c3ffce572416db067546536c')


build() {
  cd "$pkgname-$pkgver"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

package() {
  cd "$pkgname-$pkgver"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm755 "_build/wasm3" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/wasm3"
}
