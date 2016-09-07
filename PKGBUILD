# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mkinitcpio-archlogo
pkgver=0.2.0.r10.g8b31162
pkgrel=1
pkgdesc='Add colored Arch Linux ASCII art logo to early boot process'
arch=('any')
url='https://github.com/eworm-de/mkinitcpio-archlogo'
depends=('mkinitcpio')
makedepends=('git')
license=('GPL')
install=mkinitcpio-archlogo.install
source=('git://github.com/eworm-de/mkinitcpio-archlogo.git')
backup=('etc/archlogo.conf')
sha256sums=('SKIP')

pkgver() {
	cd mkinitcpio-archlogo/

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
	cd mkinitcpio-archlogo/

	make DESTDIR="${pkgdir}" install
}

