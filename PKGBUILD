# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=httptunnel-git
_pkgname=httptunnel
pkgver=20161001.0395baf
pkgrel=1
pkgdesc='Creates a bidirectional virtual data path tunnelled in HTTP requests'
url='https://github.com/larsbrinkhoff/httptunnel'
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('git')
source=('git+https://github.com/larsbrinkhoff/httptunnel'
        'multithread.patch')
sha1sums=('SKIP'
          '271e3aa0b4d218b7f0b39672c2b56f41566e3c26')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	patch -p1 -i ../multithread.patch
	autoreconf --install
}

build() {
	cd "${srcdir}/${_pkgname}"
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
