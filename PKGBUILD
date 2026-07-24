# Maintainer: a821 at mail de
# Contributor: Mario Finelli <mario at finel dot li>

pkgname=prql
pkgver=0.13.14
pkgrel=1
pkgdesc="a simple, powerful, pipelined SQL replacement"
arch=(x86_64)
url=https://prql-lang.org
license=(Apache-2.0)
depends=(glibc libgcc)
makedepends=(cargo python)
source=(https://github.com/PRQL/prql/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('fe92e306de6840ad55217684c88fc38ab1cd074a3e90cda7c124f00ee803b6e4')

prepare() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 target/release/prqlc "$pkgdir/usr/bin/prqlc"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
