# Maintainer: Ali <avileli@outlook.com>

pkgname=termilyon
pkgver=0.1.4
pkgrel=1
pkgdesc="GTK4+VTE tabbed terminal emulator"
arch=('x86_64')
url="https://github.com/alikaya/termilyon"
license=('MIT')
depends=('gtk4' 'vte4')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed')

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
