# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mkinitcpio-passwd
pkgver=0.1.0.r1.gf26e054
pkgrel=1
pkgdesc='Set password for main system inside initrd'
arch=('any')
makedepends=('git')
url='https://github.com/eworm-de/mkinitcpio-passwd'
license=('GPL')
install=mkinitcpio-passwd.install
source=('git://github.com/eworm-de/mkinitcpio-passwd.git')
sha256sums=('SKIP')

pkgver() {
	cd mkinitcpio-passwd/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

package() {
	cd mkinitcpio-passwd/

	install -D -m0644 hook/passwd ${pkgdir}/usr/lib/initcpio/hooks/passwd
	install -D -m0644 install/passwd ${pkgdir}/usr/lib/initcpio/install/passwd
}

