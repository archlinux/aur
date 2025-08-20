# Maintainer: Sorah Fukumori <her@sorah.jp>

pkgname=mairu
pkgdesc="on-memory AWS credentials agent and executor for AWS SSO and others"
pkgver=0.9.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/sorah/mairu"
license=('Apache-2.0')
depends=('openssl')
makedepends=('rust' 'protobuf')
options=(!lto)
_tarball=mairu-$pkgver.tar.gz
source=($_tarball::https://github.com/sorah/mairu/archive/v$pkgver.tar.gz)
sha256sums=('27c08a83c0d4e73a2f18e503ebf37855e65800e228ea13f028281938e1422c2e')
sha512sums=('4d9906a904e20c6a7dbfdb6e54345c2eafa4d34d1ffbf4cb37e5006df82843c2b5786aa79be6975d718067aa52c284ccf7b44abb5174ad0fa9cdd1dfe451aff2')
install=mairu.install

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/mairu" "$pkgdir/usr/bin/mairu"
}

