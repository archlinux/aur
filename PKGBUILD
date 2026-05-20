# Maintainer: Emilio Escobar <emilio@flumeirc.io>
pkgname=flume
pkgver=1.2.7
pkgrel=1
pkgdesc="Modern terminal IRC client with scripting and LLM support"
arch=('x86_64' 'aarch64')
url="https://github.com/FlumeIRC/flume"
license=('Apache-2.0')
depends=('gcc-libs' 'python')
makedepends=('rust' 'cargo' 'python')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/FlumeIRC/flume/archive/v$pkgver.tar.gz")
sha256sums=('792371404ce736b1e935252a0a6b00b0b7716d8a6743d57d5279c9175c086535')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked -p flume-tui --features python
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/flume" "$pkgdir/usr/bin/flume"
  install -Dm644 "doc/flume.1" "$pkgdir/usr/share/man/man1/flume.1"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
