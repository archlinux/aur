# Maintainer: Emilio Escobar <emilio@flumeirc.io>
pkgname=flume
pkgver=1.2.5
pkgrel=1
pkgdesc="Modern terminal IRC client with scripting and LLM support"
arch=('x86_64' 'aarch64')
url="https://github.com/FlumeIRC/flume"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FlumeIRC/flume/archive/v$pkgver.tar.gz")
sha256sums=('f0fbd6184db87fd85c2a7a0e06abecec2f511d70d5860bd896f3df144d570fab')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked -p flume-tui
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/flume" "$pkgdir/usr/bin/flume"
  install -Dm644 "doc/flume.1" "$pkgdir/usr/share/man/man1/flume.1"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
