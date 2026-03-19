pkgname='codex-app-linux-bin'
pkgver='26.318.11754_launcher.1'
pkgrel=1
pkgdesc='Codex Linux desktop app repackaged from official upstream releases.'
arch=('x86_64')
url='https://github.com/better-slop/codex-app-linux'
license=('custom')
depends=('alsa-lib' 'gtk3' 'libnotify' 'libsecret' 'libxss' 'nss' 'xdg-utils')
install='codex-app-linux-bin.install'
source=(
  'codex-app-linux-26.318.11754-launcher.1-x64-linux-unpacked.tar.gz::https://github.com/better-slop/codex-app-linux/releases/download/v26.318.11754-launcher.1/codex-app-linux-26.318.11754-launcher.1-x64-linux-unpacked.tar.gz'
  'codex-app-linux-26.318.11754-launcher.1-x64.png::https://github.com/better-slop/codex-app-linux/releases/download/v26.318.11754-launcher.1/codex-app-linux-26.318.11754-launcher.1-x64.png'
)
sha256sums=(
  '37fde75a64f25f492c4e2c0b3547a3ffd352d2ce4c7c24b093795ba6d429d746'
  '1c926e380bfe6a50f40648dd9bc5de88da7271546491adf99ec72172e17df6a0'
)

package() {
  install -dm755 "${pkgdir}/opt/codex-app-linux"
  cp -a "${srcdir}/linux-unpacked/." "${pkgdir}/opt/codex-app-linux/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/codex-app-linux/codex-app-linux" "${pkgdir}/usr/bin/codex-app-linux"

  install -Dm644 "${srcdir}/codex-app-linux-26.318.11754-launcher.1-x64.png"     "${pkgdir}/usr/share/icons/hicolor/512x512/apps/codex-app-linux.png"

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
