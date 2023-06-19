pkgname=rymdport
pkgver=3.4.0
pkgrel=2
pkgdesc='Cross-platform application for easy encrypted sharing of files, folders, and text between devices.'
arch=('x86_64')
url="https://github.com/Jacalz/$pkgname"
license=('GPLv3')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7e284a2baba6c795f4933eb8d2a6d1a5f6f765295853776921c57e9bed550d5f')

build() {
  cd "$pkgname-$pkgver"
  make LDFLAGS=""
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  make install "DESTDIR=$pkgdir"

  # fix icon location
  install -Dm644 "$pkgdir/usr/share/icons/hicolor/512x512/io.github.jacalz.rymdport.png" "$pkgdir/usr/share/pixmaps/io.github.jacalz.rymdport.png"
  install -Dm644 "$pkgdir/usr/share/icons/hicolor/scalable/io.github.jacalz.rymdport.svg" "$pkgdir/usr/share/pixmaps/io.github.jacalz.rymdport.svg"
  rm -rf "$pkgdir/usr/share/icons"
}
