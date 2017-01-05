# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=udev-block-notify-git
pkgver=0.7.9.r3.g61c3a6f
pkgrel=1
pkgdesc="Notify about udev block events - git checkout"
arch=('i686' 'x86_64')
url="https://github.com/eworm-de/udev-block-notify"
depends=('libsystemd' 'libnotify' 'udev' 'gnome-icon-theme' 'gnome-icon-theme-extras')
makedepends=('git' 'systemd' 'markdown')
provides=('udev-block-notify')
conflicts=('udev-block-notify')
license=('GPL')
source=('git://github.com/eworm-de/udev-block-notify.git')
sha256sums=('SKIP')

pkgver() {
	cd udev-block-notify/

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

build() {
	cd udev-block-notify/

	make
}

package() {
	cd udev-block-notify/

	make DESTDIR="${pkgdir}" install
}

