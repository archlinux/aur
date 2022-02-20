# Maintainer: devvick <root@devvick.eu>

pkgname=zeronsd
pkgver=0.2.6
pkgrel=1
pkgdesc="Unicast DNS resolver for ZeroTier networks"
url="https://github.com/zerotier/zeronsd"
license=("BSD-3-Clause")
arch=("any")
depends=("zerotier-one")
makedepends=("cargo" "git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/zerotier/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b4fb96fe1ff527b4f397905c82db8705822f054b60773ed81af271e2cdac455f')

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
