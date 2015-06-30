# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=libnss-gw-name-git
pkgver=0.3.1.r1.g521d539
pkgrel=1
pkgdesc='Name Service Switch (NSS) module that resolves the name 'gateway.localhost' to the IP of the current default gateway - git checkout'
arch=('i686' 'x86_64')
url='http://www.joachim-breitner.de/projects#libnss-gw-name'
license=('GPL')
makedepends=('git')
provides=('libnss-gw-name')
conflicts=('libnss-gw-name')
install=libnss-gw-name-git.install
source=('git://git.nomeata.de/libnss-gw-name.git')
sha256sums=('SKIP')

pkgver() {
	cd libnss-gw-name/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}


build() {
	cd libnss-gw-name/
	make
}

package() {
	cd libnss-gw-name/
	make DESTDIR="${pkgdir}/" install
}

