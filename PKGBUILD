# Maintainer: a821 at mail de
# Contributor: Mario Finelli <mario at finel dot li>

pkgname=prql
pkgver=0.13.8
pkgrel=1
pkgdesc="a simple, powerful, pipelined SQL replacement"
arch=(x86_64)
url=https://prql-lang.org
license=(Apache-2.0)
depends=(gcc-libs)
makedepends=(cargo python)
source=(https://github.com/PRQL/prql/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('68fb0ee26239de7b63da3af60a63f01dee290b433e52a2805d28735700ad6b3d')

prepare() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
