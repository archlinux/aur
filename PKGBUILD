# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=dhcpcd-hook-pdnsd
pkgver=0.2.0.r2.g596c6be
pkgrel=1
pkgdesc="Hook for dhcpcd to add domain name servers to pdnsd (dns caching proxy)"
arch=('any')
depends=('pdnsd' 'dhcpcd')
makedepends=('git')
url="https://github.com/eworm-de/dhcpcd-hook-pdnsd"
license=('GPL')
source=('git://github.com/eworm-de/dhcpcd-hook-pdnsd.git')
install=dhcpcd-hook-pdnsd.install
sha256sums=('SKIP')

pkgver() {
	cd dhcpcd-hook-pdnsd/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

package() {
	cd dhcpcd-hook-pdnsd/

	make DESTDIR="${pkgdir}" install
}

