# Maintainer: João Vitor Polverari <dev at ayru dot dev>
pkgname=marmota-daily
pkgver=1.0.0
pkgrel=1
pkgdesc='Daily note templating system'
arch=('x86_64' 'aarch64')
url='https://github.com/B3ella/groundhog'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a3de328a8025524701acb008a40a146d4b3a74d4a0d4c3d28ba82db49d454048')

prepare() {
  cd "groundhog-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "groundhog-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "groundhog-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "groundhog-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/groundhog"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 readme.md "$pkgdir/usr/share/doc/$pkgname/readme.md"
}
