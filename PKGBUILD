# Maintainer: Gryt Chat <sivert@gryt.chat>
pkgname=gryt-chat-bin
pkgver=1.0.131
pkgrel=1
pkgdesc='Gryt Chat — real-time voice chat desktop client'
arch=('x86_64')
url='https://gryt.chat'
license=('AGPL-3.0-or-later')
depends=('alsa-lib' 'gtk3' 'libnotify' 'libxss' 'libxtst' 'nss' 'xdg-utils')
optdepends=(
  'libappindicator-gtk3: tray icon support'
  'avahi: LAN server discovery via mDNS'
)
provides=('gryt-chat')
conflicts=('gryt-chat')
options=('!strip' '!debug')
source=("https://github.com/Gryt-chat/gryt/releases/download/v${pkgver}/Gryt-Chat-${pkgver}-linux-amd64.deb")
# Update with: updpkgsums
sha256sums=('SKIP')

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}/"

  # Fix permissions
  find "${pkgdir}" -type d -exec chmod 755 {} +

  # Desktop file + icon use the correct app ID
  install -Dm644 "${pkgdir}/usr/share/applications/gryt-chat.desktop" \
    "${pkgdir}/usr/share/applications/gryt-chat.desktop"

  # Symlink to /usr/bin if not already present
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf '/opt/Gryt Chat/gryt-chat' "${pkgdir}/usr/bin/gryt-chat"
}
