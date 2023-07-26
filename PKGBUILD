# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=prql
pkgver=0.9.2
pkgrel=1
pkgdesc="a simple, powerful, pipelined SQL replacement"
arch=(x86_64)
url=https://prql-lang.org
license=(Apache)
depends=(gcc-libs)
makedepends=(cargo python)
checkdepends=(clang)
source=(https://github.com/PRQL/prql/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('39f3a72667654b4feeb72a832bac506b91a297e2c5e92bbbb552cfb89a20baed')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

check() {
  cd $pkgname-$pkgver
  cargo test --all --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 target/release/prqlc "$pkgdir/usr/bin/prqlc"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
