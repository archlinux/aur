# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=prql
pkgver=0.11.1
pkgrel=1
pkgdesc="a simple, powerful, pipelined SQL replacement"
arch=(x86_64)
url=https://prql-lang.org
license=(Apache)
depends=(gcc-libs)
makedepends=(cargo python)
checkdepends=(clang)
source=(https://github.com/PRQL/prql/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('98c8509dfb216e35f6e51a7a79c2fd59b3fe603d74242914a19a796f2b9c9bd0')

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
