# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mkinitcpio-randommac
pkgver=0.1.0.r1.g9141f2a
pkgrel=1
pkgdesc='Initialize network device with random mac address'
arch=('any')
depends=('macchanger')
makedepends=('git')
url='https://github.com/eworm-de/mkinitcpio-randommac'
license=('GPL')
install=mkinitcpio-randommac.install
source=('git://github.com/eworm-de/mkinitcpio-randommac.git')
sha256sums=('SKIP')

pkgver() {
	cd mkinitcpio-randommac/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

package() {
	cd mkinitcpio-randommac/

	install -D -m0644 hook/randommac ${pkgdir}/usr/lib/initcpio/hooks/randommac
	install -D -m0644 install/randommac ${pkgdir}/usr/lib/initcpio/install/randommac
}

