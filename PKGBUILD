# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=dyndhcpd-git
pkgver=0.0.9.r0.gdb40123
pkgrel=1
pkgdesc="start DHCP daemon that dynamically creates configuration based on assigned IP address - git checkout"
arch=('i686' 'x86_64')
url="https://github.com/eworm-de/dyndhcpd"
depends=('dhcp')
optdepends=('ipxe: for network boot')
makedepends=('git' 'markdown')
license=('GPL')
conflicts=('dyndhcpd')
provides=('dyndhcpd')
source=('git://github.com/eworm-de/dyndhcpd.git')
backup=('etc/dyndhcpd/dhcpd.conf')

pkgver() {
	cd dyndhcpd/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd dyndhcpd/

	make
}

package() {
	cd dyndhcpd/

	make DESTDIR="${pkgdir}" install
}

sha256sums=('SKIP')
