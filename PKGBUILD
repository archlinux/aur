# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=udev-block-notify-git
pkgver=0.7.3.r0.g542058e
pkgrel=1
pkgdesc="Notify about udev block events - git checkout"
arch=('i686' 'x86_64')
url="https://github.com/eworm-de/udev-block-notify"
depends=('libnotify' 'udev' 'gnome-icon-theme' 'gnome-icon-theme-extras')
makedepends=('git' 'markdown')
provides=('udev-block-notify')
conflicts=('udev-block-notify')
license=('GPL')
source=('git://github.com/eworm-de/udev-block-notify.git')

pkgver() {
	cd udev-block-notify/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd udev-block-notify/

	make
}

package() {
	cd udev-block-notify/

	make DESTDIR="${pkgdir}" install
}

sha256sums=('SKIP')
