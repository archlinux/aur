# Maintainer: graysky <therealgraysky AT protonmail DOT com>

pkgname=wireguard-vanity-address
pkgver=0.4.0
_commit=803e4c5606f16cc81de44b968ef4cd11acc1a8c4
pkgrel=1.1
pkgdesc="Generate Wireguard keypairs with a given prefix string"
arch=(x86_64)
url="https://github.com/warner/wireguard-vanity-address"
license=(MIT)
makedepends=(rust)
depends=(gcc-libs)
source=("$pkgname-$pkgver-${_commit:0:10}.tar.gz::https://github.com/warner/$pkgname/archive/$_commit.tar.gz")
b2sums=('9175d6f20c28ba3b08c3cf6c33f03510bcb32c04dbed41fc571d2bcce9cc6aa182ffa73c175ef904e3edb46ad3fa82d642d2c125767f016089eb0678e1892dd7')

build() {
  cd "$pkgname-$_commit"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$_commit"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
