# Maintainer: Emanuel Ramirez Alsina <eramirez2718@gmail.com>
pkgname=termitype
pkgver=0.0.8
pkgrel=1
pkgdesc="TUI typing game, inspired by a certain typing test you might know. "
arch=('x86_64' 'aarch64')
url="https://github.com/emanuel2718/termitype"
license=('GPL3')

depends=('gcc-libs' 'sqlite')                          # runtime: libsqlite3.so
makedepends=('rust' 'cargo' 'git' 'pkgconf')  # build-time detect via pkg-config

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f22a7dd7141d75f4668140d9397f3d01611db8d6eb39d54b1d4a3ec14d50adf5')

build() {
  cd "$pkgname-$pkgver"
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
