# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cns
pkgver=0.1.1
pkgrel=1
pkgdesc="Search through rust crates without leaving the terminal"
arch=('x86_64')
url="https://github.com/adamsky/cns"
license=('MIT')
depends=('gcc-libs' 'libx11')
makedepends=('rust' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('d34f890067d592a86d41f50d5ecae2e20afa7a36e5d55be9cc5f4dfcda364f04372e62fcff5fab8306180d65345811070dfb8498b6470c192a5479afdea04151')

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
