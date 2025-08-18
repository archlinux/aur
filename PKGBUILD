# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Sam Stuewe <halosghost at archlinux dot info>

_name='calcurse'
pkgname="${_name}-git"
pkgver=4.8.2.2050.68cab14
pkgrel=1
pkgdesc='A text-based personal organizer (Git version).'
arch=('x86_64')
url='https://calcurse.org/'
license=('BSD')
depends=('ncurses')
makedepends=('git' 'asciidoc' 'autoconf-archive')
provides=('calcurse')
conflicts=('calcurse')
source=("git+https://git.calcurse.org/calcurse.git/")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_name}"
	printf '%s.%s.%s' "$(git describe HEAD | cut -d 'v' -f2 | cut -d '-' -f1)" \
		"$(git rev-list --count HEAD)" "$(git log -1 --pretty=format:%h)"
}

build() {
	cd "${srcdir}/${_name}"

	./autogen.sh
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

check() {
	cd "${srcdir}/${_name}"
	make check
}

package() {
	cd "${srcdir}/${_name}"
	make DESTDIR="${pkgdir}" install
}
