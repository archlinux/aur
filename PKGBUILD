# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=udev-block-notify-git
pkgver=0.7.11.r1.ga3d3230
pkgrel=2
pkgdesc="Notify about udev block events - git checkout"
arch=('i686' 'x86_64')
url="https://github.com/eworm-de/udev-block-notify"
depends=('libsystemd' 'libnotify' 'udev' 'gnome-icon-theme-extras')
makedepends=('git' 'systemd' 'discount')
provides=('udev-block-notify')
conflicts=('udev-block-notify')
license=('GPL')
source=('git+https://github.com/eworm-de/udev-block-notify.git')
sha256sums=('SKIP')

pkgver() {
	cd udev-block-notify/

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
	cd udev-block-notify/

	make
}

package() {
	cd udev-block-notify/

	make DESTDIR="${pkgdir}" install
}

