# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: Skallwar <estblcsk@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=suckit
pkgver=0.1.2
pkgrel=1
pkgdesc="Recursively visit and download a website's content to your disk"
arch=('any')
url="https://github.com/Skallwar/suckit"
license=('Apache')
depends=('openssl' 'gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b21111152b5c00fb3b92b191d0a125e4487d4caf4c7bbe92be67472c3c14a6d91e377142dd74fe1563e34769b15839be5b2159d389ac21c0d035a0190f5d3fe0')

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
}
