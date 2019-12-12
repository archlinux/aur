# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Co-Maintainer: telans <telans@protonmail.com>
# Contributor: Matthew McGinn <mamcgi at gmail dot com>
# Contributor: alicewww <almw at protonmail dot com>
pkgname=mullvad-vpn-bin
pkgver=2019.10
pkgrel=1
pkgdesc="The Mullvad VPN client app for desktop"
url="https://www.mullvad.net"
arch=('x86_64')
license=('GPL3')
depends=('libnotify' 'libappindicator-gtk3' 'libxss' 'nss')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
install="${pkgname%-bin}.install"
source=("https://github.com/mullvad/mullvadvpn-app/releases/download/$pkgver/MullvadVPN-${pkgver}_amd64.deb"{,.asc})
sha256sums=('78ade70b2400352a9e764e314811d3c2a758d6489b492160a12513771d5c9359'
            'SKIP')
validpgpkeys=('A1198702FC3E0A09A9AE5B75D5A1D4F266DE8DDF') # Mullvad (code signing) <admin at mullvad dot net>

package() {
	tar -xvf data.tar.xz -C "$pkgdir"

	ln -s "/opt/Mullvad VPN/mullvad-gui" "$pkgdir/usr/bin/${pkgname%-bin}"

	install -Dm644 "$pkgdir/opt/Mullvad VPN/resources/mullvad-daemon.service" \
		"$pkgdir/usr/lib/systemd/system/mullvad-daemon.service"
}
