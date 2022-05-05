# Maintainer: graysky <therealgraysky AT protonmail DOT com>

pkgname=wireguard-vanity-address
pkgver=0.4.0
pkgrel=1
pkgdesc="Generate Wireguard keypairs with a given prefix string"
arch=(x86_64)
url="https://github.com/warner/wireguard-vanity-address"
license=(MIT)
makedepends=(rust)
depends=(gcc-libs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/warner/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('8bc6fedd3a17b40b4d0018ad8f1fb8c067345480794d16c980cb354b733e130af930fa137d6b02e0c1e7a2bd0716a6a7134416711f9b681b90c212f2529c0794')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
