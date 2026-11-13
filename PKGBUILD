# Maintainer: Hamdy Abou El Anein (https://github.com/hamdyaea)
# Stable upstream static binary, Arch Linux / Manjaro / CachyOS.
pkgname=whydown-bin
pkgver=0.12.3
pkgrel=1
pkgdesc='Prebuilt static read-only Linux diagnostics (CLI, TUI, Qt6 GUI)'
arch=('x86_64' 'aarch64')
url='https://github.com/hamdyaea/WhyDown'
license=('GPL-3.0-only')
provides=('whydown')
conflicts=('whydown')
optdepends=('python-pyqt6: optional Qt6 graphical interface')
source_x86_64=("https://github.com/hamdyaea/WhyDown/releases/download/v${pkgver}/whydown-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/hamdyaea/WhyDown/releases/download/v${pkgver}/whydown-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('30f506293953ea1976a1384c6c31b0016f619af3b8aa35269b1f2ecec9cf93b3')
sha256sums_aarch64=('95a269a710f70faf485ae8051edc40c1e88d0a59f780ff458b814c3beb9ae7a7')

check() {
  cd "$srcdir"
  ./whydown --version | grep -Fx "whydown ${pkgver}"
}

package() {
  cd "$srcdir"
  install -Dm755 whydown "$pkgdir/usr/bin/whydown"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/whydown/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/whydown/README.md"
  install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  ./whydown icon > "$pkgdir/usr/share/icons/hicolor/256x256/apps/whydown.png"
  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/whydown.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=WhyDown
Comment=Evidence-based, read-only Linux troubleshooting
Exec=whydown gui
TryExec=whydown
Icon=whydown
Terminal=false
Categories=System;Utility;
Keywords=systemd;diagnostics;troubleshooting;
DESKTOP
}
