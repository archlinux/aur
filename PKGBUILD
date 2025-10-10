# Maintainer: a821 at mail de
# Contributor: Mario Finelli <mario at finel dot li>

pkgname=prql
pkgver=0.13.5
pkgrel=1
pkgdesc="a simple, powerful, pipelined SQL replacement"
arch=(x86_64)
url=https://prql-lang.org
license=(Apache-2.0)
depends=(gcc-libs)
makedepends=(cargo python)
source=(https://github.com/PRQL/prql/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('487c710f8b810bb8457ffab944f62930791f23e5ddb25f2bf3257001f07ae0eb')

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
