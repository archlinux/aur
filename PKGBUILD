# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=gst-plugin-gif
pkgver=0.12.0
pkgrel=2
pkgdesc="GStreamer GIF plugin"
url="https://crates.io/crates/gst-plugin-gif"
license=('Apache-2.0' 'MIT')
arch=('x86_64')
provides=("libgstgif.so")
conflicts=("gst-plugins-rs")
depends=('gst-plugins-base-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('19c655ca8e32df099d13265f7ec7ab30a4a53b0753194d9391e64a1536c846f0')

prepare() {
  cd $pkgname-$pkgver
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $pkgname-$pkgver
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --all-features --frozen --release
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE-APACHE LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 target/release/libgstgif.so -t "$pkgdir/usr/lib/gstreamer-1.0"
}
