# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mpd-notification-git
pkgver=0.5.2.r6.g53787fc
pkgrel=1
pkgdesc='Notify about tracks played by mpd - git checkout'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/mpd-notification'
depends=('ffmpeg' 'libnotify' 'libmpdclient' 'gnome-icon-theme')
makedepends=('git' 'markdown')
license=('GPL')
source=('git://github.com/eworm-de/mpd-notification.git')

pkgver() {
	cd mpd-notification/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd mpd-notification/

	make
}

package() {
	cd mpd-notification/

	make DESTDIR="${pkgdir}" install
}

sha256sums=('SKIP')
