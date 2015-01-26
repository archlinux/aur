# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='dwgrep'
pkgver='0.2'
pkgrel='1'
pkgdesc='Tool and library for querying Dwarf (debuginfo) graphs.'
url='http://pmachata.github.io/dwgrep/'
arch=('i686' 'x86_64')
makedepends=('cmake' 'flex' 'bison' 'python-sphinx')
license=('LGPL')
depends=('elfutils')
source=("https://github.com/pmachata/dwgrep/archive/${pkgver}.tar.gz")
sha512sums=('0cef77cded64f437f40e92c87409e43de667f6033dcb7188d9beff97ab3deb1de2ee66043c8a34fac7a9b9a45c325ea92559905a6997c581bdd65099ef052ada')

build () {
	cd "${pkgname}-${pkgver}"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
	make doc
}

package () {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	# Fix library directory name in 64-bit targets.
	if [[ -d ${pkgdir}/usr/lib64 ]] ; then
		mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
	fi
}
