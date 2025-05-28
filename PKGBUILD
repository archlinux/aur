# Maintainer: Your Name <dennnn8888@gmail.com>
pkgname=aniparser
pkgver=0.2.1
pkgrel=1
pkgdesc="AniParser Electron application"
arch=('x86_64')
url="https://github.com/Sinedka/aniparser"
license=('MIT')
depends=('electron' 'nodejs')
makedepends=('npm' 'git')
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  # Create directories
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  install -dm755 "$pkgdir/usr/bin"
  
  # Copy application files
  cp -r dist-electron/ "$pkgdir/usr/lib/$pkgname/"
  cp -r dist-react/ "$pkgdir/usr/lib/$pkgname/dist-electron/"
  
  # Install desktop file and icon
  install -Dm644 "dist-react/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  
  # Create desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=AniParser
Comment=AniParser Electron application
Exec=$pkgname
Icon=$pkgname
Terminal=false
Type=Application
Categories=Utility;
EOF
  
  # Create launcher script with debugging
  cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
exec electron /usr/lib/$pkgname/dist-electron/main.js
EOF
  
  chmod 755 "$pkgdir/usr/bin/$pkgname"
} 