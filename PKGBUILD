# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=libcapsule
pkgver=0.20251201.0
pkgrel=1
pkgdesc='Load libraries from host system into a container.'
url='https://gitlab.collabora.com/vivek/libcapsule'
license=('MIT' 'LGPL-2.1-or-later' 'GPL-2.0-or-later' 'GPL-3.0-or-later' 'FSFAP')
depends=('glibc' 'libelf')
makedepends=('libxslt' 'git' 'autoconf-archive' 'gtk-doc')
arch=('x86_64')
sha256sums=('aeea92e4ecb300551cf1b880af2517cc9bab625aefb337424a78a74654cdc94f')
source=("git+${url}.git#tag=v${pkgver}")
options=(!'emptydirs')

_srcdir="${pkgname}"

prepare() {
	cd "${_srcdir}"
	autoreconf -ivf
}

build() {
	CFLAGS+="${CFLAGS} -Wno-error"
	cd "${_srcdir}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${_srcdir}"
	make DESTDIR="${pkgdir}" install

	rm -rf "${pkgdir}/usr/share/installed-tests"
	rm -rf "${pkgdir}/usr/libexec"
}
