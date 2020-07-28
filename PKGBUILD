# Maintainer: orhun <orhunparmaksiz@gmail.com>
pkgname=kmon
pkgver=1.3.0
pkgrel=1
pkgdesc="Linux kernel manager and activity monitor"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/orhun/kmon"
license=('GPL3')
depends=('libxcb')
makedepends=('cargo' 'python')
options=('zipman')
source=("$pkgname-$pkgver.tar.gz::https://github.com/orhun/kmon/archive/v$pkgver.tar.gz")
sha512sums=('9d6fb5f24480c829bbff23d3c1ee7e6de09e238bf62424ca92e0f6ef13f5f7aae455b7a4667fe268d9fae1a6e5fe7dc89b34a302ee463955721209408a740f52')

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
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "man/$pkgname.8" -t "$pkgdir/usr/share/man/man8"
}