# Maintainer: Gryt Chat <sivert@gryt.chat>
#
# publish-aur.yml copies this file into the AUR repo on every release and
# rewrites pkgver, pkgrel and sha256sums, so those three are placeholders.
pkgname=gryt-chat-bin
pkgver=1.10.2
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
sha256sums=('c49ff17c77d5a5b9880942e29432685b986382c1b76753fda98a132eacd94a37')

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}/"

  find "${pkgdir}" -type d -exec chmod 755 {} +

  # The binary lives in a directory with a space in it, so /usr/bin gets a link.
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf '/opt/Gryt Chat/gryt-chat' "${pkgdir}/usr/bin/gryt-chat"
}
