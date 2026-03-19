pkgname='codex-app-linux-beta-bin'
pkgver='26.317.21539_beta.1084.launcher.1'
pkgrel=1
pkgdesc='Codex Beta Linux desktop app repackaged from official upstream releases.'
arch=('x86_64')
url='https://github.com/better-slop/codex-app-linux'
license=('custom')
depends=('alsa-lib' 'gtk3' 'libnotify' 'libsecret' 'libxss' 'nss' 'xdg-utils')
install='codex-app-linux-beta-bin.install'
source=(
  'codex-app-linux-26.317.21539-beta.1084.launcher.1-x64-linux-unpacked.tar.gz::https://github.com/better-slop/codex-app-linux/releases/download/v26.317.21539-beta.1084.launcher.1/codex-app-linux-26.317.21539-beta.1084.launcher.1-x64-linux-unpacked.tar.gz'
  'codex-app-linux-26.317.21539-beta.1084.launcher.1-x64.png::https://github.com/better-slop/codex-app-linux/releases/download/v26.317.21539-beta.1084.launcher.1/codex-app-linux-26.317.21539-beta.1084.launcher.1-x64.png'
)
sha256sums=(
  '223e2ce01c7bf1eb83a606c6675cb77d69b913aa01dc6411dcabe64b4786ddf4'
  '1c926e380bfe6a50f40648dd9bc5de88da7271546491adf99ec72172e17df6a0'
)

package() {
  install -dm755 "${pkgdir}/opt/codex-app-linux-beta"
  cp -a "${srcdir}/linux-unpacked/." "${pkgdir}/opt/codex-app-linux-beta/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/codex-app-linux-beta/codex-app-linux-beta" "${pkgdir}/usr/bin/codex-app-linux-beta"

  install -Dm644 "${srcdir}/codex-app-linux-26.317.21539-beta.1084.launcher.1-x64.png"     "${pkgdir}/usr/share/icons/hicolor/512x512/apps/codex-app-linux-beta.png"

  cat > "codex-app-linux-beta.desktop" <<'EOF'
[Desktop Entry]
Name=Codex Beta
Comment=Launch Codex Beta on Linux
Exec=codex-app-linux-beta %U
Terminal=false
Type=Application
Icon=codex-app-linux-beta
Categories=Development;
StartupNotify=true
EOF

  install -Dm644 "codex-app-linux-beta.desktop"     "${pkgdir}/usr/share/applications/codex-app-linux-beta.desktop"

  install -Dm644 "${pkgdir}/opt/codex-app-linux-beta/LICENSE.electron.txt"     "${pkgdir}/usr/share/licenses/codex-app-linux-beta-bin/LICENSE.electron.txt"
}
