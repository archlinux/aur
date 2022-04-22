pkgname=rymdport
pkgver=3.0.0
pkgrel=3
pkgdesc='Cross-platform application for easy encrypted sharing of files, folders, and text between devices.'
arch=('x86_64')
url="https://github.com/Jacalz/$pkgname"
license=('GPLv3')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('efd23df961040e2c8b8263cac2e37bc08a5ad6c24713f5985d49a0cd33576cdb')

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
