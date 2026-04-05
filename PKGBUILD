# Maintainer: submit as i2pchat-tui-bin on AUR (see packaging/aur/README.md)
pkgname=i2pchat-tui-bin
pkgver=1.2.3
pkgrel=3
pkgdesc="I2PChat Textual TUI only (official Linux TUI zip, binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/MetanoicArmor/I2PChat"
license=('AGPL-3.0-or-later')
depends=('hicolor-icon-theme' 'zlib')
conflicts=()
provides=('i2pchat-tui')
options=('!strip')
_icon="icon.png::${url}/raw/v${pkgver}/icon.png"
source_x86_64=("I2PChat-linux-x86_64-tui-v${pkgver}.zip::${url}/releases/download/v${pkgver}/I2PChat-linux-x86_64-tui-v${pkgver}.zip"
               "${_icon}")
source_aarch64=("I2PChat-linux-aarch64-tui-v${pkgver}.zip::${url}/releases/download/v${pkgver}/I2PChat-linux-aarch64-tui-v${pkgver}.zip"
                "${_icon}")
sha256sums_x86_64=('afea5ce6ff31db968a847747de5801dbff039146eca78006ca306b2a12910ad6'
                   'c49c198bef05e1cf3bf159858acefad100981fb21437e47e2588fcc1e4ad7217')
sha256sums_aarch64=('065d57bad56acc36e870f227badd08219e45a39a561a43448f4cd938e90d8f87'
                    'c49c198bef05e1cf3bf159858acefad100981fb21437e47e2588fcc1e4ad7217')

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/opt/i2pchat-tui"
  cp -a i2pchat-tui usr "$pkgdir/opt/i2pchat-tui/"
  chmod +x "$pkgdir/opt/i2pchat-tui/i2pchat-tui" \
    "$pkgdir/opt/i2pchat-tui/usr/bin/I2PChat-tui"
  install -dm755 "$pkgdir/usr/bin"
  ln -sf /opt/i2pchat-tui/i2pchat-tui "$pkgdir/usr/bin/i2pchat-tui"
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/i2pchat-tui.png"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/i2pchat-tui.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=I2P Chat (TUI)
Comment=I2PChat terminal UI
Exec=i2pchat-tui
Icon=i2pchat-tui
Terminal=true
Categories=Network;Chat;
EOF
}
