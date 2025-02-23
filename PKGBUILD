pkgname=rymdport
pkgver=3.8.0
pkgrel=0
pkgdesc='Cross-platform application for easy encrypted sharing of files, folders, and text between devices.'
arch=('x86_64')
url="https://github.com/Jacalz/$pkgname"
license=('GPLv3')
depends=('libglvnd' 'libxcursor' 'libxrandr' 'libxcursor' 'libx11' 'libxinerama' 'libxi')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2b0dbf4faea7ad56368780a71b89be3ced26c8155b371a69700ba358bf90a99d')

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
