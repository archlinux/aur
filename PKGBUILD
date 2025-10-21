# Maintainer: Berke Enercan <berkeenercan@tutanota.com>

pkgname=ytsub
pkgver=0.7.0
pkgrel=1

pkgdesc='A subscriptions only TUI Youtube client'
url='https://github.com/sarowish/ytsub'
arch=('x86_64')
license=('GPL-3.0-only')
depends=('sqlite')
optdepends=('mpv: for playing videos', 'yt-dlp: for playing videos')
makedepends=('cargo')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a96c81a41ce1cb7f43570cedb07cee3bf2a9a7db16800d9c5a4b117bcb66f562')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
