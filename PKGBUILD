# Maintainer: orhun <orhunparmaksiz@gmail.com>
pkgname=kmon
pkgver=1.3.4
pkgrel=1
pkgdesc="Linux kernel manager and activity monitor"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/orhun/kmon"
license=('GPL3')
depends=('libxcb')
makedepends=('cargo' 'python')
options=('zipman')
source=("$pkgname-$pkgver.tar.gz::https://github.com/orhun/kmon/archive/v$pkgver.tar.gz")
sha512sums=('fa44d73e3071e6699ea667c43646ac870068e6770aa881462bc8a78ab5a7c939b2247fab7fdf995c36a252b6d111cd6ecc633df6b6a86e58bd55a623699ebf27')

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