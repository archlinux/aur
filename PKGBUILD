# Contributor : Ionut Biru <ibiru@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Alexander Mieland (dma147) <dma147@linux-stats.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Maintainer: David Schury < dasc at posteo de >

pkgname=confuse-git
_pkgname=libconfuse
pkgver=3.0.16.gb6b8d65
pkgrel=1
pkgdesc='C-library for parsing configuration files'
arch=('any')
url='https://github.com/martinh/libconfuse'
license=('LGPL')
depends=('glibc')
makedepends=('git')
conflicts=('confuse')
provides=("confuse=${pkgver}")
source=("${_pkgname}::git+https://github.com/martinh/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --tags | sed -e 's|-|.|g' -e 's|^v||'
}

build() {
	cd "${_pkgname}"
	./autogen.sh
	./configure --prefix=/usr --enable-shared
	make
}

package() {
	cd "${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
