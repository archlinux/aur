pkgname='codex-app-unofficial'
pkgver='26.609.30741_launcher.27'
pkgrel=1
pkgdesc='Unofficial Linux build of Codex from OpenAI'\''s Codex appcast feed.'
arch=('x86_64')
url='https://github.com/better-slop/codex-app-linux'
license=('custom')
depends=('alsa-lib' 'gtk3' 'libnotify' 'libsecret' 'libxss' 'nss' 'xdg-utils')
provides=('codex-app-linux-bin')
conflicts=('codex-app-linux-bin')
replaces=('codex-app-linux-bin')
install='codex-app-unofficial.install'
source=(
  'codex-app-linux-26.609.30741-launcher.27-x64-linux-unpacked.tar.gz::https://github.com/better-slop/codex-app-linux/releases/download/v26.609.30741-launcher.27/codex-app-linux-26.609.30741-launcher.27-x64-linux-unpacked.tar.gz'
  'codex-app-linux-26.609.30741-launcher.27-x64.png::https://github.com/better-slop/codex-app-linux/releases/download/v26.609.30741-launcher.27/codex-app-linux-26.609.30741-launcher.27-x64.png'
)
sha256sums=(
  '6273abcb5bb7f1b831682576b556810f884807003b011a7d65d8c77cf74fb5bf'
  '1c926e380bfe6a50f40648dd9bc5de88da7271546491adf99ec72172e17df6a0'
)

package() {
  install -dm755 "${pkgdir}/opt/codex-app-linux"
  cp -a "${srcdir}/linux-unpacked/." "${pkgdir}/opt/codex-app-linux/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/codex-app-linux/codex-app-linux" "${pkgdir}/usr/bin/codex-app-linux"

  install -Dm644 "${srcdir}/codex-app-linux-26.609.30741-launcher.27-x64.png"     "${pkgdir}/usr/share/icons/hicolor/512x512/apps/codex-app-linux.png"

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

  install -Dm644 "${pkgdir}/opt/codex-app-linux/LICENSE.electron.txt"     "${pkgdir}/usr/share/licenses/codex-app-unofficial/LICENSE.electron.txt"
}
