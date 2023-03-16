# Maintainer: traumweh <contact@traumweh.dev>

pkgname="duckypad_daemon"
pkgver=0.1.1
pkgrel=1
pkgdesc="A profile autoswitcher daemon for dekuNukem's duckypad"
arch=("x86_64")
url="https://github.com/traumweh/duckypad_daemon"
license=("Apache")
provides=("duckypad_daemon")
depends=("libusb" "duckypad-udev")
makedepends=("cargo")
source=("https://github.com/traumweh/duckypad_daemon/releases/download/$pkgver/$pkgname-$pkgver-$arch-linux.tar.gz")
sha512sums=("34ee33b73f442888b97b9e6b6dcc74f6528f76dbdbebd78e3255aaf0789400d51911e6b714bff8d628a8c24fabbf2ca1dfe85870c461e6e449b562b1f12ce8af")

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
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
