# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=mullvad-vpn-beta-bin
_pkgver=2023.5
_channel=beta
_rel=1
pkgver=${_pkgver}.${_channel}${_rel}  # beta
#pkgver=${_pkgver}.${_channel}  # stable
pkgrel=1
pkgdesc="The Mullvad VPN client app for desktop (beta channel)"
arch=('x86_64' 'aarch64')
url="https://www.mullvad.net"
license=('GPL3')
depends=('alsa-lib' 'gtk3' 'iputils' 'libnotify' 'nss')
provides=("${pkgname%-*-*}")
conflicts=("${pkgname%-*-*}")
install="${pkgname%-*-*}.install"
source=("${pkgname%-*-*}.sh")
source_x86_64=(
  "https://github.com/mullvad/mullvadvpn-app/releases/download/2023.5-beta1/MullvadVPN-2023.5-beta1_amd64.deb"{,.asc}  # beta
#  "https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}/MullvadVPN-${_pkgver}_amd64.deb"{,.asc}  # stable
  )
source_aarch64=(
  "https://github.com/mullvad/mullvadvpn-app/releases/download/2023.5-beta1/MullvadVPN-2023.5-beta1_arm64.deb"{,.asc}  # beta
#  "https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}/MullvadVPN-${_pkgver}_arm64.deb"{,.asc}  # stable
  )
sha256sums=('a59c29f07b4eab9af56f0e8be42bae0d83726f5185e88de0c5a48f4098c3c0a4')
sha256sums_x86_64=('2f4eb7accc7b316258657aa56146510a676f52a9c4510041b49223c6a10fcee8'
                   'SKIP')
sha256sums_aarch64=('987396b299d2f863fa79e473ccd7b2e3ac89da5b386f4bb32afffb4a90d2ac88'
                    'SKIP')
validpgpkeys=('A1198702FC3E0A09A9AE5B75D5A1D4F266DE8DDF') # Mullvad (code signing) <admin@mullvad.net>

package() {
  bsdtar -xvf data.tar.xz -C "$pkgdir/"
  chmod 4755 "$pkgdir/opt/Mullvad VPN/chrome-sandbox"

  # Link to the GUI binary
  install -m755 "$srcdir/${pkgname%-*-*}.sh" "$pkgdir/usr/bin/${pkgname%-*-*}"

  # Move ZSH completions to correct directory
  mv "$pkgdir/usr/local/share/zsh" "$pkgdir/usr/share/"
  rm -rf "$pkgdir/usr/local"
}
