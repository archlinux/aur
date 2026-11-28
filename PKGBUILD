# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=syspass-cli
pkgver=0.12.1
pkgrel=1
pkgdesc="CLI client for sysPass"
arch=('x86_64')
url="https://github.com/ggnosh/syspass-cli"
license=('MIT')
depends=(glibc libgcc openssl)
makedepends=(cargo git)
options=(!lto)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('d2eeae04f5e6ab7b3480545b4826b5d7dc2d367ee6df5f86481e2c69d92d6f4d')

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
