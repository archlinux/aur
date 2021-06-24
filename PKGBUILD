# Maintainer: devvick <root@devvick.eu>

pkgname=zeronsd
pkgver=0.2.1
pkgrel=2
pkgdesc="Unicast DNS resolver for ZeroTier networks"
url="https://github.com/zerotier/zeronsd"
license=("BSD-3-Clause")
arch=("any")
makedepends=("cargo" "git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/zerotier/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
https://github.com/zerotier/$pkgname/archive/refs/tags/v$pkgver.tar.gz
sha256sums=("c779035f29d7834a61bdc8e783ed06c6c541f0ead51a023e533a3ac8ee1fd1af")

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
