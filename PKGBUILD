# Maintainer: diegul

pkgname=xpanel-desktop-bin
pkgver=1.0.1
pkgrel=1
arch=('x86_64')
url="https://github.com/diegul/xpanel-desktop"
license=('MIT')
depends=('glibc' 'gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'xdg-utils')
optdepends=('fuse2: run AppImages without extraction')
provides=('xpanel-desktop')
conflicts=('xpanel-desktop')

source=(
  "https://github.com/diegul/xpanel-desktop/releases/latest/download/xpanel-desktop-linux-x86_64.AppImage"
  "xpanel-desktop.desktop"
  "xpanel-desktop.png"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
  install -Dm755 "$srcdir/xpanel-desktop-linux-x86_64.AppImage" \
    "$pkgdir/opt/xpanel-desktop/xpanel-desktop.AppImage"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/xpanel-desktop" <<'EOF'
#!/usr/bin/env bash
exec /opt/xpanel-desktop/xpanel-desktop.AppImage "$@" \
  || /opt/xpanel-desktop/xpanel-desktop.AppImage --appimage-extract-and-run "$@"
EOF

  install -Dm644 "$srcdir/xpanel-desktop.desktop" \
    "$pkgdir/usr/share/applications/xpanel-desktop.desktop"
  install -Dm644 "$srcdir/xpanel-desktop.png" \
    "$pkgdir/usr/share/pixmaps/xpanel-desktop.png"
}
