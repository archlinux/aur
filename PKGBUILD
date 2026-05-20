# Maintainer: Ali <avileli@outlook.com>

pkgname=termilyon
pkgver=0.1.7
pkgrel=1
pkgdesc="GTK4+VTE tabbed terminal emulator"
arch=('x86_64')
url="https://github.com/alikaya/termilyon"
license=('MIT')
depends=('gtk4' 'vte4')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('470f3e7cb7f079fe9e4635b40d6d9f708e69d811fd130bfb4b83967ac8a7a89c')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/termilyon" "$pkgdir/usr/bin/termilyon"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "termilyon.desktop" "$pkgdir/usr/share/applications/termilyon.desktop"
  install -Dm644 "logo.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/termilyon.png"
}
