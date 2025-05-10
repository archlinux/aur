# Maintainer: Alessandro Fulgini <fuljo97 at gmail dot com>
pkgname='rofi-vscode-mode'
pkgver='0.8.1'
pkgrel='1'
pkgdesc='A Rofi mode to open Visual Studio Code workspaces'
arch=('x86_64')
url='https://github.com/fuljo/rofi-vscode-mode'
license=('MIT')
depends=('rofi' 'sqlite')
makedepends=('make' 'pkg-config' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fuljo/rofi-vscode-mode/archive/v$pkgver.tar.gz")
sha256sums=('3aaf5dd638b3e24eda540b9db8f2fa68328bf481f47d48a86b0575f584fe2fd9')

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
