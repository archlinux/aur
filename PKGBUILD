# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=netlink-notify-git
pkgver=0.6.3.r3.gdde8c75
pkgrel=1
pkgdesc="Notify about netlink changes - git checkout"
arch=('i686' 'x86_64')
url="https://github.com/eworm-de/netlink-notify"
depends=('libnotify')
makedepends=('git' 'imagemagick' 'markdown')
provides=('netlink-notify')
conflicts=('netlink-notify')
license=('GPL')
install=netlink-notify.install
source=('git://github.com/eworm-de/netlink-notify.git')

pkgver() {
	cd netlink-notify/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
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

sha256sums=('SKIP')
