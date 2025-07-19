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
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('37a6ff424bf8637b4199eae7cb0c6548625e67c9aa635c03e18f23f063aadfcd')

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
