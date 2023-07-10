# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=nthash-git
pkgver=0.1.7.r2.g072f080
pkgrel=1
pkgdesc='Generate NT Hash - git checkout'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/nthash'
conflicts=('nthash')
provides=('nthash')
depends=('nettle')
makedepends=('git' 'discount')
license=('GPL')
source=('git+https://github.com/eworm-de/nthash.git')
sha256sums=('SKIP')

pkgver() {
	cd nthash/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git rev-parse --short HEAD)"
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

