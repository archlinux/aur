pkgname=rymdport
pkgver=3.7.0
pkgrel=1
pkgdesc='Cross-platform application for easy encrypted sharing of files, folders, and text between devices.'
arch=('x86_64')
url="https://github.com/Jacalz/$pkgname"
license=('GPLv3')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9092094d11cf76b0cfa3a5f3d7b4b68c1b2fb2d80c0ae28edccb1702d800e417')

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
