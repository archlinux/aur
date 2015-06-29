# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=dhcpcd-hook-openvpn
pkgver=0.2.0.r2.gdf48c35
pkgrel=1
pkgdesc="Hook for dhcpcd to send SIGUSR1 to openvpn and reestablish connection"
arch=('any')
depends=('openvpn' 'dhcpcd')
makedepends=('git')
url="https://github.com/eworm-de/dhcpcd-hook-openvpn"
license=('GPL')
source=('git://github.com/eworm-de/dhcpcd-hook-openvpn.git')
sha256sums=('SKIP')

pkgver() {
	cd dhcpcd-hook-openvpn/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

package() {
	cd dhcpcd-hook-openvpn/

	make DESTDIR="${pkgdir}" install
}

