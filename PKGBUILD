# Maintainer: ognrdrch <https://github.com/ognrdrch>
pkgname=rauri
pkgver=0.1.1
pkgrel=1
pkgdesc="A minimal AUR helper for written in Rust"
arch=('x86_64')
url="https://github.com/ognrdrch/rauri"
license=('MIT')
depends=('pacman' 'git')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ognrdrch/rauri/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3a9fc89e414f8607cc4627d22af4424e2e331273e912c925768182bf23f672d9')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
