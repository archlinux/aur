# Maintainer: Your Name <your.email@example.com>
pkgname=goodnotes-electron
pkgver=1.0.0
pkgrel=1
pkgdesc="Unofficial Electron wrapper for GoodNotes web app"
arch=('x86_64')
url="https://web.goodnotes.com"
license=('MIT')
depends=('electron')
makedepends=('npm' 'nodejs')
source=("https://github.com/belanasaikiran/goodnotes-electron/releases/download/1.0.0/goodnotes-electron-1.0.0.tar.gz")
sha256sums=('328477e7bd9687c9a0f93165276859b3e8b55b9ca04a92d5f94f4559542720d7')

build() {
  cd "$srcdir"
  npm install
}

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -r . "$pkgdir/usr/lib/$pkgname"

  # Add a launcher
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/bash
exec electron /usr/lib/$pkgname
EOF

install -Dm644 goodnotes.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/goodnotes.png"

  # Optionally install a .desktop file
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=GoodNotes
Exec=$pkgname
Icon=goodnotes
Type=Application
Categories=Office;
EOF
}
