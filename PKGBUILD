# Maintainer: devvick <root@devvick.eu>

pkgname=zeronsd
pkgver=0.2.3
pkgrel=1
pkgdesc="Unicast DNS resolver for ZeroTier networks"
url="https://github.com/zerotier/zeronsd"
license=("BSD-3-Clause")
arch=("any")
depends=("zerotier-one")
makedepends=("cargo" "git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/zerotier/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fe48b2a50b577b77444836400fe9870f879d2d14d2432f81a12f1f4e6ad00117')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
