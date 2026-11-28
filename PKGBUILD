# Maintainer: Vade <72322348+MetanoicArmor@users.noreply.github.com>
# Checksums: ./packaging/refresh-checksums.sh vX.Y.Z
pkgname=i2pchat-bin
pkgver=1.7.1
pkgrel=1
pkgdesc="P2P (peer-to-peer) chat client over I2P network (GUI version)"
arch=('x86_64' 'aarch64')
url="https://github.com/MetanoicArmor/I2PChat"
license=('AGPL-3.0-or-later')
depends=('hicolor-icon-theme' 'zlib')
provides=('i2pchat')
conflicts=('i2pchat' 'i2pchat-ng-git')
options=('!strip')
_icon="icon.png::${url}/raw/v${pkgver}/icon.png"
source_x86_64=("I2PChat-linux-x86_64-v${pkgver}.zip::${url}/releases/download/v${pkgver}/I2PChat-linux-x86_64-v${pkgver}.zip"
               "${_icon}")
source_aarch64=("I2PChat-linux-aarch64-v${pkgver}.zip::${url}/releases/download/v${pkgver}/I2PChat-linux-aarch64-v${pkgver}.zip"
                "${_icon}")
sha256sums_x86_64=('d8b2a49ff6d0c74e60cd5d063d4ed69991a450b959abdfb1a335fad0023a2fb8'
                   '2f27e90c85949ec4eabeaac6d12bca1449f679dbb10e4e9f07925e33b7d008b8')
sha256sums_aarch64=('581f7b5b16397f28cfd1dd1011b7d9c6f36c7c00b222c5975e4a73d9e7b9dbb3'
                    '2f27e90c85949ec4eabeaac6d12bca1449f679dbb10e4e9f07925e33b7d008b8')

package() {
  cd "$srcdir"
  case "${CARCH}" in
    x86_64)  _app="I2PChat-linux-x86_64-v${pkgver}.AppImage" ;;
    aarch64) _app="I2PChat-linux-aarch64-v${pkgver}.AppImage" ;;
    *)
      echo "ERROR: unsupported CARCH=${CARCH}" >&2
      exit 1
      ;;
  esac
  install -dm755 "$pkgdir/opt/i2pchat"
  install -Dm755 "$_app" "$pkgdir/opt/i2pchat/I2PChat.AppImage"
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/i2pchat.png"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/i2pchat.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=I2P Chat
Comment=P2P chat over I2P
Exec=/usr/bin/i2pchat %u
Icon=i2pchat
Terminal=false
Categories=Network;Chat;
EOF
  install -dm755 "$pkgdir/usr/bin"
  ln -sf /opt/i2pchat/I2PChat.AppImage "$pkgdir/usr/bin/i2pchat"
}
