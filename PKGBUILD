# Maintainer: Nick Dowsett <nickdowsett42@gmail.com>

pkgname=youtui
pkgver=0.0.4
pkgrel=1
pkgdesc="A simple TUI YouTube Music player written in Rust aiming to implement an Artist->Albums workflow for searching for music, and using discoverability principles for navigation. Writtten in Rust."
url="https://github.com/nick42d/youtui"
arch=('x86_64' 'armv7h' 'aarch64')
license=('MIT')
depends=('alsa-lib' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('ccd55ed8eb9995f8be06dedbbf589f337842d40dfe87a12ea5131eacd852e6a5')

prepare() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}


build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd $pkgname-$pkgver
  install -Dm0644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
