# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=networkmanager-dispatcher-openvpn
pkgver=0.r6.g031bc89
pkgrel=2
pkgdesc='Networkmanager Dispatcher script for OpenVPN'
arch=('any')
depends=('openvpn' 'networkmanager')
makedepends=('git')
url='https://github.com/eworm-de/networkmanager-dispatcher-openvpn'
license=('GPL')
source=('git+https://github.com/eworm-de/networkmanager-dispatcher-openvpn.git')
sha256sums=('SKIP')

pkgver() {
	cd networkmanager-dispatcher-openvpn/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count main)" \
			"$(git rev-parse --short HEAD)"
	fi
}

package() {
	cd networkmanager-dispatcher-openvpn/

	make DESTDIR="${pkgdir}" install
}

