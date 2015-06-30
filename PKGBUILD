# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mkinitcpio-uname
pkgver=0.1.0.r6.g606252e
pkgrel=1
pkgdesc='Add uname output to early boot process'
arch=('any')
url='https://github.com/eworm-de/mkinitcpio-uname'
makedepends=('git')
license=('GPL')
install=mkinitcpio-uname.install
source=('git://github.com/eworm-de/mkinitcpio-uname.git')
sha256sums=('SKIP')

pkgver() {
	cd mkinitcpio-uname/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

package() {
	cd mkinitcpio-uname/

	install -D -m0644 install/uname ${pkgdir}/usr/lib/initcpio/install/uname
	install -D -m0755 hook/uname ${pkgdir}/usr/lib/initcpio/hooks/uname
	install -D -m0644 systemd/uname.service ${pkgdir}/usr/lib/systemd/system/uname.service
	install -D -m0755 systemd/uname ${pkgdir}/usr/lib/systemd/scripts/uname
}

