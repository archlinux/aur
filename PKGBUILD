# Maintainer: BlueIsekai <bluesisekai@gmail.com>

pkgname=moviebox-tui
pkgver=0.1.7
pkgrel=1
pkgdesc="A terminal client for finding and streaming movies, TV shows, and anime from the MovieBox catalog"
arch=('x86_64')
url="https://github.com/mesamirh/MovieBox-Tui"
license=('MIT OR Apache-2.0')

options=('!lto')

depends=('glibc' 'libgcc')
makedepends=('cargo')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('919283a85ba583f8f7a53c87e8738261acbbfe5c05a86bf9443149aaa2834e1c4ffa6141d7eb04c1f9a376cdbc6d72ba9b273e600d930a13b1fb114623c6884c')

prepare() {
  cd "MovieBox-Tui-$pkgver"
  cargo fetch --locked
}

build() {
  cd "MovieBox-Tui-$pkgver"

  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "MovieBox-Tui-$pkgver"

  install -Dm755 target/release/moviebox-tui \
    "$pkgdir/usr/bin/moviebox-tui"

  install -Dm644 LICENSE-MIT \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"

  install -Dm644 LICENSE-APACHE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
