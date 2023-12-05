# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=networkmanager-dispatcher-timesyncd
pkgver=0.r5.gbdeed3f
pkgrel=2
pkgdesc='Networkmanager Dispatcher script for systemd-timesyncd'
arch=('any')
depends=('systemd' 'networkmanager')
makedepends=('git')
url="https://github.com/eworm-de/networkmanager-dispatcher-timesyncd"
license=('GPL')
source=('git+https://github.com/eworm-de/networkmanager-dispatcher-timesyncd.git')
sha256sums=('SKIP')

pkgver() {
	cd networkmanager-dispatcher-timesyncd/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git rev-parse --short HEAD)"
	fi
}

package() {
	cd networkmanager-dispatcher-timesyncd/

	make DESTDIR="${pkgdir}" install
}

