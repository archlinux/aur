# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=prql
pkgver=0.4.0
pkgrel=1
pkgdesc="a simple, powerful, pipelined SQL replacement"
arch=(x86_64)
url=https://prql-lang.org
license=(Apache)
depends=(gcc-libs)
makedepends=(cargo python)
checkdepends=(clang)
source=(https://github.com/PRQL/prql/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('7387b529071fbc89944649d9a9b9cb1b919ca7288560cc96f428c0a77337e752')

build() {
  cd $pkgname-$pkgver
  cargo build --features=cli --release --locked
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
