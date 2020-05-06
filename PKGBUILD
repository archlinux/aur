# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=mullvad-vpn-beta-bin
_pkgver=2020.4
_channel=beta
pkgver=${_pkgver}.${_channel}4
pkgrel=1
pkgdesc="The Mullvad VPN client app for desktop (latest/beta release)"
url="https://www.mullvad.net"
arch=('x86_64')
license=('GPL3')
depends=('libnotify' 'libappindicator-gtk3' 'libxss' 'nss')
optdepends=('bash-completion')
provides=("${pkgname%-beta-bin}")
conflicts=("${pkgname%-beta-bin}")
install="${pkgname%-beta-bin}.install"
source=("https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}-${_channel}4/MullvadVPN-${_pkgver}-${_channel}4_amd64.deb"{,.asc}
        "${pkgname%-beta-bin}.sh")
sha256sums=('1b2c903c0b56cbe7acd0d01295043606d18835a20fa152b7fa06dafe61dbf0a8'
            'SKIP'
            'a59c29f07b4eab9af56f0e8be42bae0d83726f5185e88de0c5a48f4098c3c0a4')
validpgpkeys=('A1198702FC3E0A09A9AE5B75D5A1D4F266DE8DDF') # Mullvad (code signing) <admin at mullvad dot net>

package() {
	tar -xvf data.tar.xz -C "$pkgdir"

	# Link to the GUI binary
	install -m755 "$srcdir/${pkgname%-beta-bin}.sh" "$pkgdir/usr/bin/${pkgname%-beta-bin}"

	# Install daemon service
	install -Dm644 "$pkgdir/opt/Mullvad VPN/resources/mullvad-daemon.service" \
		"$pkgdir/usr/lib/systemd/system/mullvad-daemon.service"
}
