# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=journal-notify-git
pkgver=0.0.8.r7.gd187bd3
pkgrel=1
pkgdesc="Notify about journal log entries - git checkout"
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/journal-notify'
depends=('libnotify' 'systemd' 'gnome-icon-theme')
makedepends=('git' 'markdown')
provides=('journal-notify')
conflicts=('journal-notify')
license=('GPL')
source=('git://github.com/eworm-de/journal-notify.git')
sha256sums=('SKIP')

pkgver() {
	cd journal-notify/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd journal-notify/

	make
}

package() {
	cd journal-notify/

	make DESTDIR="${pkgdir}" install
}

