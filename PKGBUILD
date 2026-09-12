# Maintainer: tiouoo <tiouo@qq.com>

pkgname=lilt-bin
pkgver=0.0.0.0
pkgrel=1
pkgdesc="Lilt desktop application (stable release)"
arch=('x86_64')
url="https://github.com/tiouoo/lilt"
license=('AGPL-3.0-or-later')
depends=('fuse2' 'hicolor-icon-theme')
provides=('lilt')
conflicts=('lilt' 'lilt-commit-bin' 'lilt-nightly-bin')
options=('!strip' '!emptydirs')
_appimg="Lilt.AppImage"
source_x86_64=(
  "$_appimg::https://github.com/tiouoo/lilt/releases/latest/download/Lilt.linux.x64.AppImage"
  "lilt.png::https://raw.githubusercontent.com/tiouoo/lilt/main/assets/Icon-Pattern.png"
)
sha256sums_x86_64=('SKIP' 'SKIP')
noextract=("$_appimg")

package() {
  install -Dm755 "$srcdir/$_appimg" "$pkgdir/opt/lilt/Lilt.AppImage"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/lilt" <<'EOF'
#!/bin/sh
exec /opt/lilt/Lilt.AppImage "$@"
EOF
  install -Dm644 "$srcdir/lilt.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/lilt.png"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/lilt.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Lilt
Comment=Lilt desktop application
Icon=lilt
Exec=lilt
Terminal=false
Categories=Utility;
EOF
}
