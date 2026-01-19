pkgname=myrient
pkgver=1.0.0
pkgrel=1
pkgdesc="Bulk downloader and extractor for ROM archive directories"
arch=('x86_64')
url="https://github.com/cruzisonfire/myrient"
license=('GPL3')
depends=('qt6-base')
makedepends=('git' 'qt6-tools')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "myrient.desktop"
  "myrient.png"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake6
  make clean
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install GUI binary
  install -Dm755 myrient-qt "$pkgdir/usr/bin/myrient-gui"

  # Install .desktop launcher
  install -Dm644 "$srcdir/myrient.desktop" "$pkgdir/usr/share/applications/myrient.desktop"

  # Install icon
  install -Dm644 "$srcdir/myrient.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/myrient.png"
}
