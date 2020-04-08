# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: telans <telans@protonmail.com>
pkgname=mullvad-vpn-beta-bin
_pkgver=2020.4
_channel=beta
pkgver=${_pkgver}.${_channel}2
pkgrel=1
pkgdesc="The Mullvad VPN client app for desktop (latest/beta release)"
url="https://www.mullvad.net"
arch=('x86_64')
license=('GPL3')
depends=('libnotify' 'libappindicator-gtk3' 'libxss' 'nss')
provides=("${pkgname%-beta-bin}")
conflicts=("${pkgname%-beta-bin}")
install="${pkgname%-beta-bin}.install"
source=("https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}-${_channel}2/MullvadVPN-${_pkgver}-${_channel}2_amd64.deb"{,.asc}
        "${pkgname%-beta-bin}.sh")
sha256sums=('2bc911b814d7d21dd7185602cadbe450b4e0062ecf211a1447059ad15b3be751'
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
