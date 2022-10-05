# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=mullvad-vpn-beta-bin
_pkgver=2022.5
_channel=beta
_rel=2
# beta
pkgver=${_pkgver}.${_channel}${_rel}
# stable
#pkgver=${_pkgver}.${_channel}
pkgrel=1
pkgdesc="The Mullvad VPN client app for desktop (beta channel)"
arch=('x86_64' 'aarch64')
url="https://www.mullvad.net"
license=('GPL3')
depends=('iputils' 'libnotify' 'libappindicator-gtk3' 'nss')
provides=("${pkgname%-*-*}")
conflicts=("${pkgname%-*-*}")
install="${pkgname%-*-*}.install"
source=(
        "https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}-${_channel}${_rel}/MullvadVPN-${_pkgver}-${_channel}${_rel}_amd64.deb"{,.asc} # beta
        "https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}-${_channel}${_rel}/MullvadVPN-${_pkgver}-${_channel}${_rel}_arm64.deb"{,.asc} # beta
#        "https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}/MullvadVPN-${_pkgver}_amd64.deb"{,.asc} # stable
#        "https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}/MullvadVPN-${_pkgver}_arm64.deb"{,.asc} # stable
        "${pkgname%-*-*}.sh"
       )
sha256sums=('cb5abb13c5f21c98d120415732a291893d43ade9cb698c6c91cef1a2c2abc113'
            'SKIP'
            'b83efa6dbfb59d1bf3979e8011b8ad8a156c0aa1f27d30c175941bda5b5dbfac'
            'SKIP'
            'a59c29f07b4eab9af56f0e8be42bae0d83726f5185e88de0c5a48f4098c3c0a4')
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
