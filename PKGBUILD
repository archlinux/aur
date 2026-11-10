pkgname=photoes
pkgver=0.1.0
pkgrel=1
pkgdesc='A fast, minimal, AI-first photos app for Linux'
arch=('x86_64' 'aarch64')
url='https://github.com/siliconwitch/photoes'
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'libjxl'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-bad'
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('37c1be01b0afc902eadf67232cc96f9b1308049845fdd0a52c17fa0ea0bc12f7')

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
  install -Dm755 target/release/photoes -t "$pkgdir/usr/bin"
}
