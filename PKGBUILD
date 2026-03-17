# Maintainer: Rodrigo Santiago <rodrigosntg@gmail.com>
pkgname=omarchy-screenshot-preview
pkgver=0.1.0
pkgrel=1
pkgdesc="macOS-style screenshot preview with drag-and-drop for Wayland/Hyprland"
arch=('x86_64')
url="https://github.com/rodrigo-sntg/omarchy-screenshot-preview"
license=('MIT')
makedepends=('cargo' 'gtk4' 'gtk4-layer-shell')
depends=(
  'gtk4'
  'gtk4-layer-shell'
)
optdepends=(
  'satty: default screenshot editor'
  'grim: screenshot capture'
  'wl-clipboard: clipboard support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
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
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
