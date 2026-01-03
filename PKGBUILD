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
sha256sums=('2713887471b9296b8ac03f51f616d5dee5ea251e7b3cd45ba206010f768c10b3')

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
