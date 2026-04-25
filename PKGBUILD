# Maintainer: submit as i2pchat-tui-bin on AUR (see packaging/aur/README.md)
# Checksums: ./packaging/refresh-checksums.sh vX.Y.Z or sha256sum local zips after release.
pkgname=i2pchat-tui-bin
pkgver=1.3.2
pkgrel=1
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
sha256sums_x86_64=('9219e80102853f25648e8ba89d1c218ca5c510a8b16a3d6f102fc94fbe21e9a4'
                   '2f27e90c85949ec4eabeaac6d12bca1449f679dbb10e4e9f07925e33b7d008b8')
sha256sums_aarch64=('db70c37c065cc16ae28c0b3449e9ced03478d6f12369839c94d028f7ba2f3fe7'
                    '2f27e90c85949ec4eabeaac6d12bca1449f679dbb10e4e9f07925e33b7d008b8')

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
