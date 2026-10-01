# Maintainer: SLIGHTLKE <SLIGHTLKE@outlook.com>
pkgname=obs-studio-appimage
pkgver=32.2.2
pkgrel=2.6
pkgdesc="OBS-Studio package based on AppImage"
arch=('x86_64')
url="https://github.com/ivan-hc/OBS-Studio-appimage"
license=('GPL-3.0-or-later')
optdepends=('xdg-utils')
options=(!strip)

source=(
  "OBS-Studio_32.2.2-2.6-archimage5.0-full-x86_64.AppImage ::https://github.com/ivan-hc/OBS-Studio-appimage/releases/download/continuous/OBS-Studio_32.2.2-2.6-archimage5.0-full-x86_64.AppImage"
  "LICENSE::https://www.gnu.org/licenses/gpl-3.0.txt"
)

sha256sums=(
  '0fb1b43ccbb94cacbe453fe85a20147e4d95654d3095197100b039c019ed6430'
  'SKIP'
)

package() {
  install -dm755 "$pkgdir/opt/OBS-Studio/appimage"
  chown -R $USER:$USER "$pkgdir/opt/OBS-Studio"
  install -Dm755 "$srcdir/OBS-Studio_32.2.2-2.6-archimage5.0-full-x86_64.AppImage" \
                 "$pkgdir/opt/OBS-Studio/appimage/OBS-Studio_32.2.2-2.6-archimage5.0-full-x86_64.AppImage"

  install -dm755 "$pkgdir/usr/bin"
cat > "$pkgdir/usr/bin/obs" << 'EOF'
#!/bin/sh
export HOME=/opt/OBS-Studio
exec /opt/OBS-Studio/appimage/OBS-Studio_32.2.2-2.6-archimage5.0-full-x86_64.AppImage
EOF

  chmod 755 "$pkgdir/usr/bin/obs"
  install -dm755 "$pkgdir/usr/share/applications"
cat > "$pkgdir/usr/share/applications/obs-studio-appimage.desktop" << 'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=OBS Studio
Comment=OBS Studio Appimage
Exec=obs
Categories=AudioVideo;
Terminal=false
EOF

  install -Dm644 "$srcdir/LICENSE" \
                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
