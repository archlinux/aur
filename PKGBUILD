pkgname=soia-bin
pkgver=0.2.11
pkgrel=1
pkgdesc='Media player based on libmpv, with DLNA, SMB and WebDAV support'
arch=('x86_64')
url='https://github.com/FengZeng/soia'
license=('GPL-3.0-only')
options=('!strip' '!debug')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'libayatana-appindicator'
  'wayland'
  'libxkbcommon'
  'hicolor-icon-theme'
)
optdepends=(
  'fuse2: run the AppImage through FUSE'
)
provides=('soia')
conflicts=('soia')
source=(
  "Soia-v${pkgver}-Linux-x64-wayland.AppImage::https://github.com/FengZeng/soia/releases/download/v${pkgver}/Soia-v${pkgver}-Linux-x64-wayland.AppImage"
  "soia.desktop"
  "soia.png::https://raw.githubusercontent.com/FengZeng/soia/v${pkgver}/src-tauri/icons/128x128.png"
)
sha256sums=('1aef71d080dee02e3dd6a8f6894db0a3314e31df5676f45504bde0d3d86c7113'
            'aa486e81f520b1d02f62a55977218032a863b5f065e2bb086054e28d09b5428d'
            'd5eb173344a8548a2cb290bb74b1dec85500a1eae35e07647451e3b54ed35fcd')

package() {
  install -Dm755 \
    "Soia-v${pkgver}-Linux-x64-wayland.AppImage" \
    "$pkgdir/opt/soia/Soia.AppImage"

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/soia" <<'EOF'
#!/bin/sh
exec /opt/soia/Soia.AppImage "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/soia"

  install -Dm644 soia.desktop \
    "$pkgdir/usr/share/applications/soia.desktop"

  install -Dm644 soia.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/soia.png"
}
