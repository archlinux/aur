pkgname=termilyon
pkgver=0.1.9
pkgrel=1
pkgdesc="GTK4 and VTE based terminal emulator with tabs, splits, and SSH tooling"
arch=('x86_64')
url="https://github.com/alikaya/termilyon"
license=('MIT')
depends=('gcc-libs' 'glib2' 'gtk4' 'hicolor-icon-theme' 'vte4')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8b13dce06c544d21e6fad15cd11926243dd388df1f80173cea1cfcc74e1d1f2a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "termilyon.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "logo.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 "logo.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
