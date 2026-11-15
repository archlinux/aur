# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=syspass-cli
pkgver=0.11.1
pkgrel=1
pkgdesc="CLI client for sysPass"
arch=('x86_64')
url="https://github.com/ggnosh/syspass-cli"
license=('MIT')
depends=(glibc libgcc openssl)
makedepends=(cargo git)
options=(!lto)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('77902be0cec3fc8fbac2f59f7bd49b9df343eaf831d9ae49c9643c979dbc0bc4')

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
