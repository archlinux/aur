# Maintainer: cat_nm

pkgname=wlapse
pkgver=0.1.0
pkgrel=1
pkgdesc='A lightweight stopwatch overlay for Wayland'
arch=('x86_64')
url='https://github.com/fib-nm/wlapse'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6cb7167849f7623d4815f4da31e9e6fba8936e0bd9003e34992c26e2432d13f4')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/wlapse "$pkgdir/usr/bin/wlapse"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
