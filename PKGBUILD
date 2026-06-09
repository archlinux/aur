# Maintainer: SLIGHTLKE <SLIGHTLKE@outlook.com>
pkgname=steam-appimage
pkgver=1.0.0.85.7
pkgrel=6
pkgdesc="Steam package based on AppImage"
arch=('x86_64')
url="https://github.com/ivan-hc/Steam-appimage"
license=('GPL-3.0-or-later')
optdepends=('xdg-utils')
options=(!strip)

source=(
  "Steam-1.0.0.85-7-anylinux-x86_64.AppImage::https://github.com/ivan-hc/Steam-appimage/releases/download/1.0.0.85-7%402026-06-01_1780312474/Steam-1.0.0.85-7-anylinux-x86_64.AppImage"
  "LICENSE::https://www.gnu.org/licenses/gpl-3.0.txt"
)

sha256sums=(
  '899904c2314d79d3e1791c66df59c810a0b198e7539fa33e833c1ac53358f110'
  'SKIP'
)

package() {
  install -dm755 "$pkgdir/opt/Steam/appimage"
  chown -R $USER:$USER "$pkgdir/opt/Steam"
  install -Dm755 "$srcdir/Steam-1.0.0.85-7-anylinux-x86_64.AppImage" \
                 "$pkgdir/opt/Steam/appimage/Steam-1.0.0.85-7-anylinux-x86_64.AppImage"

  install -dm755 "$pkgdir/usr/bin"
cat > "$pkgdir/usr/bin/steam" << 'EOF'
#!/bin/sh
export HOME=/opt/Steam
exec /opt/Steam/appimage/Steam-1.0.0.85-7-anylinux-x86_64.AppImage
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

  install -Dm644 "$srcdir/LICENSE"
                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
