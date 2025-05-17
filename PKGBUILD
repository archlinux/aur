# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=mdfried
pkgver=0.11.0
pkgrel=1
pkgdesc="A markdown viewer for the terminal that renders images and big headers"
arch=('x86_64')
url="https://github.com/benjajaja/mdfried"
license=('GPL-3.0-only')
depends=('gcc-libs' 'freetype2' 'expat')
makedepends=('cargo' 'cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('d9aa6da40c71fc3f11ea0521cd750c6971a418e871de26c6688fbf935af700719c601ba8ce95f1b706caa2b965360dd545142cee0fd36fc9afe10c658b35a2d1')
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
