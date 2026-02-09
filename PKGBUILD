pkgname=better-github-bin
pkgver=4.4.0
pkgrel=2
pkgdesc="better github desktop app (prebuilt appimage)"
arch=('x86_64')
url="https://github.com/krishkalaria12/better-github-desktop"
license=('MIT')
depends=('fuse2')
options=(!strip)
source=(
  "better-github.AppImage::https://github.com/krishkalaria12/better-github-desktop/releases/download/v${pkgver}/better-github_0.1.0_amd64.AppImage"
  "better-github.png::https://raw.githubusercontent.com/krishkalaria12/better-github-desktop/v${pkgver}/apps/desktop/src-tauri/icons/128x128.png"
)
sha256sums=(
  '4d8134c0c4587ee472e01cb70c948f75d148b5de7e45d06ddc4fd43e542faa3c'
  'b0992f41bb799d686939d16e1eabbe83a03e7997fab3072266dd8398319a3ec6'
)

package() {
  install -Dm755 "${srcdir}/better-github.AppImage" "${pkgdir}/opt/better-github/better-github.AppImage"
  install -Dm644 "${srcdir}/better-github.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/better-github.png"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/better-github.desktop" << 'DESKTOP'
[Desktop Entry]
Type=Application
Name=Better GitHub
Comment=Better GitHub desktop app
Exec=better-github
Icon=better-github
Categories=Development;
Terminal=false
DESKTOP

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/better-github" << 'SH'
#!/bin/sh
exec /opt/better-github/better-github.AppImage "$@"
SH
}
