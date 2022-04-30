# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: Skallwar <estblcsk@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=suckit
pkgver=0.2.0
pkgrel=1
pkgdesc="Recursively visit and download a website's content to your disk"
arch=('any')
url="https://github.com/Skallwar/suckit"
license=('Apache' 'MIT')
depends=('openssl' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('7e15dc63c4062d537739a5074ccae1669366f1e64e5f34564904aa966d18a9711bd9132195ff5c2da98c5ee5f9fa1ca9b5f4b453ffd814dae82f40027e27288c')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
