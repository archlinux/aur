# Maintainer: ognrdrch <https://github.com/ognrdrch>
pkgname=rauri
pkgver=0.1.2
pkgrel=1
pkgdesc="A minimal AUR helper for written in Rust"
arch=('x86_64')
url="https://github.com/ognrdrch/rauri"
license=('MIT')
depends=('pacman' 'git')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ognrdrch/rauri/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7b4dfe92166cfa5e02d63f2009842ba731163af9173c562de159903d806a162c')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/rauri "$pkgdir/usr/bin/rauri"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
