# Maintainer:  Antany <xiaozaihu@gmail.com>
pkgname=stratovirt
pkgver=2.1.0
pkgrel=1
pkgdesc="A light hypervisor"
arch=('x86_64')
url="https://openeuler-mirrors/stratovirt.git"
license=('Mulan PSL v2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.xz::https://github.com/openeuler-mirror/stratovirt/archive/refs/tags/v2.1.0.tar.gz")
sha256sums=("b644e58316c81cc0195c7f74dea03430ae95b1ad9cdf11041ad495761e5bf821")

prepare() {
  cd "$pkgname-$pkgver"
  rustup target add ${arch}-unknown-linux-gnu
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --target ${arch}-unknown-linux-gnu
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/${arch}-unknown-linux-gnu/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm755 "target/${arch}-unknown-linux-gnu/release/ozone" -t "$pkgdir/usr/bin"
}
