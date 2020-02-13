# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: telans <telans@protonmail.com>
pkgname=mullvad-vpn-beta-bin
_pkgver=2020.2
_channel=stable
pkgver=${_pkgver}.${_channel}
pkgrel=1
pkgdesc="The Mullvad VPN client app for desktop (latest/beta release)"
url="https://www.mullvad.net"
arch=('x86_64')
license=('GPL3')
depends=('libnotify' 'libappindicator-gtk3' 'libxss' 'nss')
provides=("${pkgname%-beta-bin}")
conflicts=("${pkgname%-beta-bin}")
install="${pkgname%-beta-bin}.install"
source=("https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}/MullvadVPN-${_pkgver}_amd64.deb"{,.asc})
sha256sums=('4f5970714684a86fba44b742d77f9bbe1147a111330e487d160d9844f34ae3d5'
            'SKIP')
validpgpkeys=('A1198702FC3E0A09A9AE5B75D5A1D4F266DE8DDF') # Mullvad (code signing) <admin at mullvad dot net>

package() {
	tar -xvf data.tar.xz -C "$pkgdir"

	ln -s "/opt/Mullvad VPN/mullvad-gui" "$pkgdir/usr/bin/${pkgname%-beta-bin}"

	install -Dm644 "$pkgdir/opt/Mullvad VPN/resources/mullvad-daemon.service" \
		"$pkgdir/usr/lib/systemd/system/mullvad-daemon.service"
}
