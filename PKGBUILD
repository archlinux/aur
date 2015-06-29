# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mkinitcpio-hostname
pkgver=0.1.0.r4.gd99bba2
pkgrel=1
pkgdesc='Set hostname for main system inside initrd'
arch=('any')
makedepends=('git')
url='https://github.com/eworm-de/mkinitcpio-hostname'
license=('GPL')
install=mkinitcpio-hostname.install
source=('git://github.com/eworm-de/mkinitcpio-hostname.git')
sha256sums=('SKIP')

pkgver() {
	cd mkinitcpio-hostname/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

package() {
	cd mkinitcpio-hostname/

	install -D -m0644 hook/hostname ${pkgdir}/usr/lib/initcpio/hooks/hostname
	install -D -m0644 install/hostname ${pkgdir}/usr/lib/initcpio/install/hostname
}

