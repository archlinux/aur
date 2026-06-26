# Maintainer: Haram Choi <altitudinem at google dot com>
pkgname=linux-totalmix-web-remote
pkgver=0.1.0
pkgrel=1
pkgdesc="Mobile web remote (PWA) and OSC bridge for linux-fireface-mixer"
arch=('x86_64')
url="https://github.com/oudeis01/linux-totalmix-web-remote"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
optdepends=('linux-fireface-mixer: the desktop mixer this remote controls')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3342771f223ee45af78c19410ac8b7fc0cd3ecbc0e9cb01b17e8381384ffaa7e')

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 README-kr.md "$pkgdir/usr/share/doc/$pkgname/README-kr.md"
}
