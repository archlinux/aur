# Maintainer: devvick <root@devvick.eu>

pkgname=zeronsd
pkgver=0.2.2
pkgrel=1
pkgdesc="Unicast DNS resolver for ZeroTier networks"
url="https://github.com/zerotier/zeronsd"
license=("BSD-3-Clause")
arch=("any")
makedepends=("cargo" "git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/zerotier/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
https://github.com/zerotier/$pkgname/archive/refs/tags/v$pkgver.tar.gz
sha256sums=("4425d9bbe3a6d62b5bf3e34102c08834e9e339e0656fc69f6b6a42986d370748")

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
