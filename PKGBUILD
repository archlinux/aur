# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=networkmanager-dispatcher-timesyncd
pkgver=0.r1.g97bb92b
pkgrel=1
pkgdesc='Networkmanager Dispatcher script for systemd-timesyncd'
arch=('any')
depends=('systemd' 'networkmanager')
makedepends=('git')
url="https://github.com/eworm-de/networkmanager-dispatcher-timesyncd"
license=('GPL')
source=('git://github.com/eworm-de/networkmanager-dispatcher-timesyncd.git')
sha256sums=('SKIP')

pkgver() {
	cd networkmanager-dispatcher-timesyncd/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git log -1 --format='%h')"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git log -1 --format='%h')"
	fi
}

package() {
	cd networkmanager-dispatcher-timesyncd/

	make DESTDIR="${pkgdir}" install
}

