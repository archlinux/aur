# Maintainer: Alessandro Fulgini <fuljo97 at gmail dot com>
pkgname='rofi-vscode-mode'
pkgver='0.2.0'
pkgrel='1'
pkgdesc='A Rofi mode to open Visual Studio Code workspaces'
arch=('x86_64')
url='https://github.com/fuljo/rofi-vscode-mode'
license=('MIT')
depends=('rofi' 'sqlite')
makedepends=('make' 'pkg-config' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fuljo/rofi-vscode-mode/archive/v$pkgver.tar.gz")
sha256sums=('f07177162d573f9d5ed4b7398392562dbb5af5998ca96e66e97a6f56234487d0')

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  make all install install.doc install.licenses DESTDIR="${pkgdir}" prefix="/usr"
}
