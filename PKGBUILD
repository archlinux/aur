# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=netlink-notify-git
pkgver=0.8.1.r2.gebe67ba
pkgrel=1
pkgdesc="Notify about netlink changes - git checkout"
arch=('i686' 'x86_64')
url="https://github.com/eworm-de/netlink-notify"
depends=('libsystemd' 'libnotify')
makedepends=('git' 'systemd' 'imagemagick' 'discount')
provides=('netlink-notify')
conflicts=('netlink-notify')
license=('GPL')
source=('git+https://github.com/eworm-de/netlink-notify.git')
sha256sums=('SKIP')

pkgver() {
	cd netlink-notify/

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

build() {
	cd netlink-notify/

	make
}

package() {
	cd netlink-notify/

	make DESTDIR="${pkgdir}" install
}

