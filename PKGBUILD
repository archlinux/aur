# Maintainer: Fanyi Pu <pufanyi@gmail.com>
pkgname=waybar-google-calendar
pkgver=0.0.1
pkgrel=2
pkgdesc='GTK4/Relm4 Google Calendar popup for Waybar'
arch=('x86_64')
url='https://github.com/pufanyi/waybar-google-calendar'
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b44542fe42f21be8c2947f77153338298d244ddc3f90ca42b5948d3186c436b4')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/waybar-gcal" "$pkgdir/usr/bin/waybar-gcal"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 examples/waybar-clock.json "$pkgdir/usr/share/doc/$pkgname/examples/waybar-clock.json"
  install -Dm644 examples/custom-theme.css "$pkgdir/usr/share/doc/$pkgname/examples/custom-theme.css"
  install -Dm644 assets/themes/apple-light.css "$pkgdir/usr/share/$pkgname/themes/apple-light.css"
}
