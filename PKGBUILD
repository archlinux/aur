# Maintainer: Itonia <itonia149@gmail.com>
pkgname=gst-cam-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="A Rust-based webcam viewer and recorder using egui and GStreamer"
arch=('x86_64')
url="https://github.com/itonia149/gst-cam-rs"
license=('MIT')
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('33c54bfe8fdeebb95a6ac0117e63636e64587ae1b1e96791c5ce27408d885d39')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked --offline
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/gst-cam-rs" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
