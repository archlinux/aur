# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=mullvad-vpn-beta-bin
_pkgver=2023.5
_channel=beta
_rel=2
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
  "https://github.com/mullvad/mullvadvpn-app/releases/download/2023.5-beta2/MullvadVPN-2023.5-beta2_amd64.deb"{,.asc}  # beta
#  "https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}/MullvadVPN-${_pkgver}_amd64.deb"{,.asc}  # stable
  )
source_aarch64=(
  "https://github.com/mullvad/mullvadvpn-app/releases/download/2023.5-beta2/MullvadVPN-2023.5-beta2_arm64.deb"{,.asc}  # beta
#  "https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}/MullvadVPN-${_pkgver}_arm64.deb"{,.asc}  # stable
  )
sha256sums=('a59c29f07b4eab9af56f0e8be42bae0d83726f5185e88de0c5a48f4098c3c0a4')
sha256sums_x86_64=('acc9655a33eae7f4cc4ece5ba78c38be466a2a5330cabd82f57f7d30eed88612'
                   'SKIP')
sha256sums_aarch64=('bef8c746048775583f21b85c2097106d257d35635fe829bdb78aaa53ba31b4eb'
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
