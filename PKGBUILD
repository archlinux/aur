# Maintainer: SLIGHTLKE <SLIGHTLKE@outlook.com>
pkgname=steam-appimage
pkgver=1.0.0.87.1
pkgrel=1
pkgdesc="Steam package based on AppImage"
arch=('x86_64')
url="https://github.com/ivan-hc/Steam-appimage"
license=('GPL-3.0-or-later')
optdepends=('xdg-utils')
options=(!strip)

source=(
  "Steam-1.0.0.87-1-anylinux-x86_64.AppImage::https://github.com/ivan-hc/Steam-appimage/releases/download/1.0.0.87-1%402026-07-01_1782898538/Steam-1.0.0.87-1-anylinux-x86_64.AppImage"
  "LICENSE::https://www.gnu.org/licenses/gpl-3.0.txt"
)

sha256sums=(
  'ee8d776f781a757ab1f8677c0bdc6cc74bbfb419f617d4b1f03cb2766d506d93'
  'SKIP'
)

package() {
  install -dm755 "$pkgdir/opt/Steam/appimage"
  chown -R $USER:$USER "$pkgdir/opt/Steam"
  install -Dm755 "$srcdir/Steam-1.0.0.87-1-anylinux-x86_64.AppImage" \
                 "$pkgdir/opt/Steam/appimage/Steam-1.0.0.87-1-anylinux-x86_64.AppImage"

  install -dm755 "$pkgdir/usr/bin"
cat > "$pkgdir/usr/bin/steam" << 'EOF'
#!/bin/sh
export HOME=/opt/Steam
exec /opt/Steam/appimage/Steam-1.0.0.87-1-anylinux-x86_64.AppImage
EOF

  chmod 755 "$pkgdir/usr/bin/steam"
  install -dm755 "$pkgdir/usr/share/applications"
cat > "$pkgdir/usr/share/applications/steam-appimage.desktop" << 'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=Steam
Comment=Steam AppImage
Exec=steam
Categories=Game;
Terminal=false
EOF

  install -Dm644 "$srcdir/LICENSE" \
                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
