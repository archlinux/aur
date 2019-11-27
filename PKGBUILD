pkgname=mullvad-vpn-beta-bin
pkgver=2019.9.stable
_pkgver=2019.9
pkgrel=3
pkgdesc="The Mullvad VPN client app for desktop (latest/beta release)"
url="https://www.mullvad.net"
arch=('x86_64')
license=('GPL3')
depends=('gtk3' 'libnotify' 'libappindicator-gtk2' 'libxss' 'nss')
provides=("${pkgname%-beta-bin}")
conflicts=("${pkgname%-beta-bin}")
install="${pkgname%-beta-bin}.install"
source=("https://github.com/mullvad/mullvadvpn-app/releases/download/$_pkgver/MullvadVPN-${_pkgver}_amd64.deb"{,.asc})
sha256sums=('4ba5b1c87cb5afdadbcfb37413bdd7ea72df139dd01815e9ca0f1c54f81f03e1'
            'SKIP')
validpgpkeys=('A1198702FC3E0A09A9AE5B75D5A1D4F266DE8DDF') # Mullvad (code signing) <admin@mullvad.net>

package() {
	tar -xvf data.tar.xz -C "$pkgdir"

	ln -s "/opt/Mullvad VPN/mullvad-gui" "$pkgdir/usr/bin/${pkgname%-beta-bin}"

	install -Dm644 "$pkgdir/opt/Mullvad VPN/resources/mullvad-daemon.service" \
		"$pkgdir/usr/lib/systemd/system/mullvad-daemon.service"
}
