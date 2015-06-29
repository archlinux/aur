# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=libmnl-git
pkgver=1.0.3.r11.g050d592
pkgrel=1
pkgdesc='Library for minimalistic netlink - git checkout'
arch=('i686' 'x86_64')
url='http://www.netfilter.org/projects/libmnl/'
license=('GPL')
makedepends=('git')
provides=('libmnl')
conflicts=('libmnl')
source=('git://git.netfilter.org/libmnl.git')
sha256sums=('SKIP')

pkgver() {
	cd libmnl/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd libmnl/

	sh autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd libmnl/

	make DESTDIR="${pkgdir}" install
}

