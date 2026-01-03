# Maintainer: Ali <avileli@outlook.com>

pkgname=termilyon
pkgver=0.1.2
pkgrel=1
pkgdesc="GTK4+VTE tabbed terminal emulator"
arch=('x86_64')
url="https://github.com/alikaya/termilyon"
license=('MIT')
depends=('gtk4' 'vte4')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

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
