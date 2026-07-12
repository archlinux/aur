# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=dnsglobe
pkgver=0.4.0
pkgrel=1
pkgdesc="Global DNS propagation checker TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/514-labs/dnsglobe"
license=('MIT')
depends=(glibc libgcc)
makedepends=(cargo git)
options=(!lto)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('7e63f170acc2af62923de0c368b3c7d95ef9851b81f5b53c82bd529595def523')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target $(rustc --print host-tuple)
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
