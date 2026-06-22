pkgname=termilyon
pkgver=0.1.11
pkgrel=1
pkgdesc="GTK4 and VTE based terminal emulator with tabs, splits, and SSH tooling"
arch=('x86_64')
url="https://github.com/alikaya/termilyon"
license=('MIT')
depends=('gcc-libs' 'glib2' 'gtk4' 'hicolor-icon-theme' 'vte4')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('513d1e245b669a433c2d80ff3ebd2243cc1923c17c3f0dcde5d170398c1967c4')

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
