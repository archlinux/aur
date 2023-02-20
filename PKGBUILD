# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Matthew McGinn <mamcgi at gmail dot com>
# Contributor: alicewww <almw at protonmail dot com>
pkgname=mullvad-vpn-bin
pkgver=2023.1
pkgrel=1
pkgdesc="The Mullvad VPN client app for desktop"
arch=('x86_64' 'aarch64')
url="https://www.mullvad.net"
license=('GPL3')
depends=('iputils' 'libnotify' 'libappindicator-gtk3' 'nss')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install="${pkgname%-*}.install"
source=("${pkgname%-*}.sh")
source_x86_64=("https://github.com/mullvad/mullvadvpn-app/releases/download/$pkgver/MullvadVPN-${pkgver}_amd64.deb"{,.asc})
source_aarch64=("https://github.com/mullvad/mullvadvpn-app/releases/download/$pkgver/MullvadVPN-${pkgver}_arm64.deb"{,.asc})
sha256sums=('a59c29f07b4eab9af56f0e8be42bae0d83726f5185e88de0c5a48f4098c3c0a4')
sha256sums_x86_64=('f8d8780988e2be3ac29a887340c4a36fdcf96e000202fa2de6850004f5051314'
                   'SKIP')
sha256sums_aarch64=('1a729b47c319a475e00838d1c35ebeb6de65af479c86960d8c7e631d6c423caa'
                    'SKIP')
validpgpkeys=('A1198702FC3E0A09A9AE5B75D5A1D4F266DE8DDF') # Mullvad (code signing) <admin@mullvad.net>

package() {
  bsdtar -xvf data.tar.xz -C "$pkgdir/"
  chmod 4755 "$pkgdir/opt/Mullvad VPN/chrome-sandbox"

  # Link to the GUI binary
  install -m755 "$srcdir/${pkgname%-*}.sh" "$pkgdir/usr/bin/${pkgname%-*}"

  # Move ZSH completions to correct directory
  mv "$pkgdir/usr/local/share/zsh" "$pkgdir/usr/share/"
  rm -rf "$pkgdir/usr/local"
}
