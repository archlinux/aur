# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=nthash-git
pkgver=0.1.5.r0.g14083ae
pkgrel=1
pkgdesc="Generate NT Hash - git checkout"
arch=('i686' 'x86_64')
url="https://github.com/eworm-de/nthash"
conflicts=('nthash')
provides=('nthash')
depends=('nettle')
makedepends=('git' 'markdown')
license=('GPL')
source=('git://github.com/eworm-de/nthash.git')

pkgver() {
	cd nthash/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd nthash/

	make
}

check() {
	cd nthash/

	make check
}

package() {
	cd nthash

	make DESTDIR="${pkgdir}" install
}

sha256sums=('SKIP')
