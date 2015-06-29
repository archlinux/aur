# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=dhcpcd-hook-ntpdate
pkgver=0.2.0.r2.gc19d363
pkgrel=1
pkgdesc="Hook for dhcpcd to sync time as soon as connection is up"
arch=('any')
depends=('ntp' 'dhcpcd')
makedepends=('git')
url="https://github.com/eworm-de/dhcpcd-hook-ntpdate"
license=('GPL')
source=('git://github.com/eworm-de/dhcpcd-hook-ntpdate.git')
sha256sums=('SKIP')

pkgver() {
	cd dhcpcd-hook-ntpdate/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

package() {
	cd dhcpcd-hook-ntpdate/

	make DESTDIR="${pkgdir}" install
}

