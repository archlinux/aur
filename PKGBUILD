# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=libcapsule
pkgver=0.20240916.0
pkgrel=1
pkgdesc='Load libraries from host system into a container.'
url='https://gitlab.collabora.com/vivek/libcapsule'
license=('MIT' 'LGPL-2.1-or-later' 'GPL-2.0-or-later' 'GPL-3.0-or-later' 'FSFAP')
depends=('glibc' 'libelf')
makedepends=('libxslt' 'git' 'autoconf-archive' 'gtk-doc')
arch=('x86_64')
sha256sums=('974da4d2f23efed930942d4d0c0c123614cae3d091408bb538bf00123c04f410')
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
