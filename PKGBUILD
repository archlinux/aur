# Maintainer: Emanuel Ramirez Alsina <eramirez2718@gmail.com>
pkgname=termitype
pkgver=0.0.6
pkgrel=1
pkgdesc="Terminal-based typing test inspired by a certain typing test you might know."
arch=('x86_64' 'aarch64')
url="https://github.com/emanuel2718/termitype"
license=('GPL3')

depends=('gcc-libs' 'sqlite')                          # runtime: libsqlite3.so
makedepends=('rust' 'cargo' 'git' 'pkgconf')  # build-time detect via pkg-config

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5030a7a9516c9b0d7a1057017d95942488be29efca912e36f7ff32da7b6452dd')

build() {
  cd "$pkgname-$pkgver"
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
