pkgname=rymdport
pkgver=3.5.3
pkgrel=1
pkgdesc='Cross-platform application for easy encrypted sharing of files, folders, and text between devices.'
arch=('x86_64')
url="https://github.com/Jacalz/$pkgname"
license=('GPLv3')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5592d600f5ae1caa5cf9f712a75f9e88b3411c8fcac5bfdd666ff4c9eadbc414')

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
  install -Dm644 "$pkgdir/usr/share/icons/hicolor/512x512/apps/io.github.jacalz.rymdport.png" "$pkgdir/usr/share/pixmaps/io.github.jacalz.rymdport.png"
  install -Dm644 "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.jacalz.rymdport.svg" "$pkgdir/usr/share/pixmaps/io.github.jacalz.rymdport.svg"
  rm -rf "$pkgdir/usr/share/icons"
}
