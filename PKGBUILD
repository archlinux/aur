# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=himalaya
pkgver=0.2.6
pkgrel=1
pkgdesc="Minimalist CLI email client, written in Rust"
arch=('x86_64')
url="https://github.com/soywod/himalaya"
license=('BSD')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('d8581b7c33d196f1a6a5365244e9918a2917379649d9d06448d449ef21440ed1e80ccd3782adab63bf9e8480ea2bc7fbd2761adb885604096e7eba861f15af00')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
