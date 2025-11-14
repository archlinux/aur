# Maintainer: ognrdrch <https://github.com/ognrdrch>
pkgname=rauri
pkgver=0.1.0
pkgrel=1
pkgdesc="A minimal AUR helper for Arch Linux"
arch=('x86_64')
url="https://github.com/ognrdrch/rauri"
license=('MIT')
depends=('pacman' 'git')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ognrdrch/rauri/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d81722483b9182142c98bccee24b57ba839704a8fb15e94e169cd58602f646e9')

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
