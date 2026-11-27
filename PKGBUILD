# Maintainer: Vade <72322348+MetanoicArmor@users.noreply.github.com>
# Checksums: ./packaging/refresh-checksums.sh vX.Y.Z
pkgname=i2pchat-tui-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="P2P (peer-to-peer) chat client over I2P network (TUI version)"
arch=('x86_64' 'aarch64')
url="https://github.com/MetanoicArmor/I2PChat"
license=('AGPL-3.0-or-later')
depends=('hicolor-icon-theme' 'zlib')
provides=('i2pchat-tui')
conflicts=('i2pchat-tui' 'i2pchat-ng-tui-git')
options=('!strip')
_icon="icon.png::${url}/raw/v${pkgver}/icon.png"
source_x86_64=("I2PChat-linux-x86_64-tui-v${pkgver}.zip::${url}/releases/download/v${pkgver}/I2PChat-linux-x86_64-tui-v${pkgver}.zip"
               "${_icon}")
source_aarch64=("I2PChat-linux-aarch64-tui-v${pkgver}.zip::${url}/releases/download/v${pkgver}/I2PChat-linux-aarch64-tui-v${pkgver}.zip"
                "${_icon}")
sha256sums_x86_64=('634e3f335b9e8b547cd709bff0ec5deb838b4e3b937bb1fdda66033cd654795e'
                   '2f27e90c85949ec4eabeaac6d12bca1449f679dbb10e4e9f07925e33b7d008b8')
sha256sums_aarch64=('12ed86417a698fa5f7e8091ad2ce1327ce16b4b0506e3be3d2eb0fdeb08cc9d3'
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
Comment=P2P chat over I2P
Exec=i2pchat-tui
Icon=i2pchat-tui
Terminal=true
Categories=Network;Chat;
EOF
}
