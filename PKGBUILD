pkgname=fixplay-diagnosetool-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Cross-platform diagnostic tool for gaming consoles (AppImage release build)"
arch=('x86_64')
url="https://github.com/fabioudev/fixplay-diagnoseTool"
license=('custom:unknown')
depends=()
optdepends=('flashrom: use the system flashrom binary instead of the bundled one')
provides=('fixplay-diagnosetool')
conflicts=('fixplay-diagnosetool')
source=(
  "fixplay-diagnoseTool_${pkgver}_amd64.AppImage::https://github.com/fabioudev/fixplay-diagnoseTool/releases/download/v${pkgver}/fixplay-diagnoseTool_${pkgver}_amd64.AppImage"
  "fixplay-diagnosetool.png::https://raw.githubusercontent.com/fabioudev/fixplay-diagnoseTool/v${pkgver}/src-tauri/icons/icon_256x256.png"
)
sha256sums=('SKIP' 'SKIP')

package() {
  install -Dm755 "${srcdir}/fixplay-diagnoseTool_${pkgver}_amd64.AppImage" "${pkgdir}/opt/fixplay-diagnosetool-bin/fixplay-diagnosetool.AppImage"
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/fixplay-diagnosetool" <<'EOF'
#!/usr/bin/env bash
export APPIMAGE_EXTRACT_AND_RUN=1
exec /opt/fixplay-diagnosetool-bin/fixplay-diagnosetool.AppImage "$@"
EOF
  install -Dm644 "${srcdir}/fixplay-diagnosetool.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/fixplay-diagnosetool.png"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/fixplay-diagnosetool.desktop" <<'EOF'
[Desktop Entry]
Name=fixplay-diagnoseTool
Comment=Cross-platform diagnostic tool for gaming consoles
Exec=fixplay-diagnosetool
Icon=fixplay-diagnosetool
Type=Application
Categories=Utility;Development;
Terminal=false
StartupNotify=true
EOF
}

