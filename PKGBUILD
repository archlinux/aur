# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <vaibhavmattoo1@gmail.com>
pkgname=cxt
pkgver=0.1.6
pkgrel=1
pkgdesc="A command-line tool that aggregates file and directory contents into your clipboard, perfect for providing project context to AI chatbots"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/vaibhav-mattoo/cxt"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
optdepends=(
  'wl-clipboard: Clipboard support for Wayland'
  'xclip: Clipboard support for X11'
  'copyq: Feature-rich clipboard manager'
  'clipman: Lightweight clipboard manager for Wayland'
  'cliphist: Modern CLI clipboard manager'
  'gpaste: GNOME clipboard manager'
  'clipse: TUI clipboard manager'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/vaibhav-mattoo/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
validpgpkeys=()

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
