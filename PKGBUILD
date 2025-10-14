# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=mdfried
pkgver=0.12.9
pkgrel=1
pkgdesc="A markdown viewer for the terminal that renders images and big headers"
arch=('x86_64')
url="https://github.com/benjajaja/mdfried"
license=('GPL-3.0-only')
depends=('gcc-libs')
makedepends=('cargo' 'cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('cca2d5ebed1e83ed1ca8b664b56ad9d239cedc093aa4d08b3cb05ecd3e681111999deb0e3dc59f49d40b605ceaf62e7965404ae0ba5103303ce81722332c422e')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
}
