# Maintainer: Alessandro Fulgini <fuljo97 at gmail dot com>
pkgname='rofi-vscode-mode'
pkgver='0.13.0'
pkgrel='1'
pkgdesc='A Rofi mode to open Visual Studio Code workspaces'
arch=('x86_64')
url='https://github.com/fuljo/rofi-vscode-mode'
license=('MIT')
depends=('rofi' 'sqlite')
makedepends=('make' 'pkg-config' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fuljo/rofi-vscode-mode/archive/v$pkgver.tar.gz")
sha256sums=('f30caf02eaf31d80d9358a906a9af28d10d76d22a7e2bc6e2a86e95a45357cc2')

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

  make install install.doc install.licenses DESTDIR="${pkgdir}" prefix="/usr"
}
