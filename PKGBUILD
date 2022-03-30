# Maintainer: devvick <root@devvick.eu>

pkgname=zeronsd
pkgver=0.4.0
pkgrel=1
pkgdesc="Unicast DNS resolver for ZeroTier networks"
url="https://github.com/zerotier/zeronsd"
license=("BSD-3-Clause")
arch=("any")
depends=("zerotier-one")
makedepends=("cargo" "git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/zerotier/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a25addead674da85b83cf5fb60f89556ef290599cafaf5e573c454ffd720bc6b')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked --lib
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
