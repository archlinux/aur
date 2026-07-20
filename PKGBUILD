# Maintainer: neop <lacorteernest@gmail.com>
pkgname=neoclock
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight and simple clock app with GTK4 support, timer, alarm, and system tray"
arch=('x86_64')
url="https://github.com/neops-system/neoclock"
license=('MIT')
depends=('gtk4' 'libadwaita')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "assets/com.neops.neoclock.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/com.neops.neoclock.metainfo.xml"
}
