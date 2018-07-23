# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=librouteros-git
_pkgname=librouteros
pkgver=20180719.c485c77
pkgrel=1
pkgdesc='C library to communicate with network devices by MikroTik running their Linux-based operating system RouterOS.'
url='https://github.com/octo/librouteros'
arch=('i686' 'x86_64' 'armv7h')
license=('ISC')
makedepends=('git')
depends=('gcc-libs')
source=("git://github.com/octo/librouteros.git")
sha256sums=('SKIP')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}"
	autoreconf -i
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
