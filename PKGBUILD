# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=journal-notify-git
pkgver=0.1.1.r12.ga1c0a5e
pkgrel=1
pkgdesc='Notify about journal log entries - git checkout'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/journal-notify'
depends=('libnotify' 'systemd')
optdepends=('gnome-icon-theme: icons in notifications')
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

