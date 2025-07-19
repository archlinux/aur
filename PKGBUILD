# Maintainer: Sai Kiran Belana
pkgname=goodnotes-electron
pkgver=1.0.0
pkgrel=1
pkgdesc="Unofficial Electron wrapper for GoodNotes web app"
arch=('x86_64')
url="https://web.goodnotes.com"
license=('MIT')
depends=('electron')
makedepends=('npm' 'nodejs')
source=("https://github.com/belanasaikiran/goodnotes-electron/archive/refs/tags/1.1.0.tar.gz")
sha256sums=('38b1339e29ee9a1d2d0cdb306abe48addd05c3df5f7e77ef1c2ea21dfebf8430')

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
