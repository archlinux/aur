# Maintainer: traumweh <contact@traumweh.dev>

pkgname="duckypad_daemon"
pkgver=0.1.0
pkgrel=2
pkgdesc="A profile autoswitcher daemon for dekuNukem's duckypad"
arch=("x86_64")
url="https://github.com/traumweh/duckypad_daemon"
license=("Apache")
provides=("duckypad_daemon")
depends=("libusb" "duckypad-udev")
makedepends=("cargo")
source=("https://github.com/traumweh/duckypad_daemon/releases/download/$pkgver/$pkgname-$pkgver-$arch-linux.tar.gz")
sha512sums=("3148e9c9e4251917934fdbc24f461b06f6f9fbb6d95cdbb9b69b09bc676b39527e1048c75c248375807b916ef284e7f48a34f7a7f6982aaf3fc287deec4fb86e")

prepare() {
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}
build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}
package() {
  install -Dm0755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
