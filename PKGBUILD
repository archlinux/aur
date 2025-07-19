# Maintainer: Sai Kiran Belana
pkgname=goodnotes-electron
pkgver=1.1.2
pkgrel=1
pkgdesc="Unofficial Electron wrapper for GoodNotes web app"
arch=('x86_64')
url="https://web.goodnotes.com"
license=('MIT')
depends=('electron')
makedepends=('npm' 'nodejs')
source=("https://github.com/belanasaikiran/goodnotes-electron/archive/refs/tags/1.1.2.tar.gz")
sha256sums=('dd227cc08db01a75d1e3ecdae99e850d93e66e6252b6fef847ea38e4b8c7fc87')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  npm install
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
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
