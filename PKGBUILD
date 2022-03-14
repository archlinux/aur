pkgname=cproxy
pkgver=4.1.6
pkgrel=1
pkgdesc="Easy per application transparent proxy built on cgroup."
url="https://github.com/NOBLES5E/cproxy"
arch=(x86_64)
license=(AGPL)
depends=()
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/NOBLES5E/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('9cf5f3e4a4cff938bf7f1fe30b621a87cd6d62411866a74911530b059057aa16a63f4982484f70f1b0650f3d1dc6e0ebe4f5db15883af776ee7f469e4452fc10')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
  cd $pkgname-$pkgver
  # no tests for now
  # cargo test --release --frozen
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir/usr/bin" target/release/cproxy
  install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 README.md
}
