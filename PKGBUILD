# Maintainer: submit as i2pchat-bin on AUR (see packaging/README.md)
pkgname=i2pchat-bin
pkgver=1.2.3
pkgrel=1
pkgdesc="Experimental peer-to-peer chat client for the I2P network (official AppImage, binary)"
arch=('x86_64')
url="https://github.com/MetanoicArmor/I2PChat"
license=('AGPL-3.0-or-later')
depends=('hicolor-icon-theme' 'zlib')
options=('!strip')
_zip="I2PChat-linux-x86_64-v${pkgver}.zip"
source=("${_zip}::${url}/releases/download/v${pkgver}/${_zip}"
        "icon.png::${url}/raw/v${pkgver}/icon.png")
sha256sums=('be16b2a1ed96523b2ff7e892e7cdb09ba4b39f4c9522e8462653373d22bc3f48'
            'c49c198bef05e1cf3bf159858acefad100981fb21437e47e2588fcc1e4ad7217')

package() {
  cd "$srcdir"
  # Zip from GitHub releases contains I2PChat-linux-x86_64-v${pkgver}.AppImage
  _app="I2PChat-linux-x86_64-v${pkgver}.AppImage"
  install -dm755 "$pkgdir/opt/i2pchat"
  install -Dm755 "$_app" "$pkgdir/opt/i2pchat/I2PChat.AppImage"
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/i2pchat.png"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/i2pchat.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=I2P Chat
Comment=Secure chat over I2P
Exec=/usr/bin/i2pchat %u
Icon=i2pchat
Terminal=false
Categories=Network;Chat;
EOF
  install -dm755 "$pkgdir/usr/bin"
  ln -sf /opt/i2pchat/I2PChat.AppImage "$pkgdir/usr/bin/i2pchat"
}
