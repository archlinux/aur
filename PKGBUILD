pkgname=zenith-bar
pkgver=1.0.0
pkgrel=1
pkgdesc="Sleek animated Wayland status bar for Hyprland in Rust"
arch=(x86_64)
url="https://github.com/CPT-Dawn/Zenith"
license=(MIT)

depends=(
  gtk4
  gtk4-layer-shell
  glibc
)
makedepends=(
  cargo
)
optdepends=(
  "playerctl: media module support"
  "ttf-inter: recommended UI font"
  "ttf-jetbrains-mono-nerd: recommended icon and mono font"
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('6cbeb61d7f12107beac7083f0c5925fcf628e47fae8aa7979a321dac7ccaab94')

prepare() {
  cd "Zenith-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked
}

build() {
  cd "Zenith-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --release --locked --frozen
}

package() {
  cd "Zenith-$pkgver"

  install -Dm755 "$srcdir/target/release/zenith" "$pkgdir/usr/bin/zenith"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
