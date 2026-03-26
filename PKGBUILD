pkgname='codex-app-linux-bin'
pkgver='26.324.21641_launcher.2'
pkgrel=1
pkgdesc='Unofficial Linux build of Codex from OpenAI'\''s Codex appcast feed.'
arch=('x86_64')
url='https://github.com/better-slop/codex-app-linux'
license=('custom')
depends=('alsa-lib' 'gtk3' 'libnotify' 'libsecret' 'libxss' 'nss' 'xdg-utils')
install='codex-app-linux-bin.install'
source=(
  'codex-app-linux-26.324.21641-launcher.2-x64-linux-unpacked.tar.gz::https://github.com/better-slop/codex-app-linux/releases/download/v26.324.21641-launcher.2/codex-app-linux-26.324.21641-launcher.2-x64-linux-unpacked.tar.gz'
  'codex-app-linux-26.324.21641-launcher.2-x64.png::https://github.com/better-slop/codex-app-linux/releases/download/v26.324.21641-launcher.2/codex-app-linux-26.324.21641-launcher.2-x64.png'
)
sha256sums=(
  '821cb81ae7f3a508798ec6e4ad5c14e772d89618a184422ab5953f407156af85'
  '1c926e380bfe6a50f40648dd9bc5de88da7271546491adf99ec72172e17df6a0'
)

package() {
  install -dm755 "${pkgdir}/opt/codex-app-linux"
  cp -a "${srcdir}/linux-unpacked/." "${pkgdir}/opt/codex-app-linux/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/codex-app-linux/codex-app-linux" "${pkgdir}/usr/bin/codex-app-linux"

  install -Dm644 "${srcdir}/codex-app-linux-26.324.21641-launcher.2-x64.png"     "${pkgdir}/usr/share/icons/hicolor/512x512/apps/codex-app-linux.png"

  cat > "codex-app-linux.desktop" <<'EOF'
[Desktop Entry]
Name=Codex
Comment=Launch Codex on Linux
Exec=codex-app-linux %U
Terminal=false
Type=Application
Icon=codex-app-linux
Categories=Development;
StartupNotify=true
EOF

  install -Dm644 "codex-app-linux.desktop"     "${pkgdir}/usr/share/applications/codex-app-linux.desktop"

  install -Dm644 "${pkgdir}/opt/codex-app-linux/LICENSE.electron.txt"     "${pkgdir}/usr/share/licenses/codex-app-linux-bin/LICENSE.electron.txt"
}
