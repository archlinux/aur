# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='dwgrep'
pkgver='0.4'
pkgrel='1'
pkgdesc='Tool and library for querying Dwarf (debuginfo) graphs.'
url='http://pmachata.github.io/dwgrep/'
arch=('i686' 'x86_64')
makedepends=('cmake' 'flex' 'bison' 'python-sphinx')
license=('LGPL')
depends=('elfutils')
source=("https://github.com/pmachata/dwgrep/archive/${pkgver}.tar.gz")
sha512sums=('46d1ce472acb40dda46ac7fefcf9ed301f96208ed1eb0403c87793a10575d961772a8920e21bfbc672dc9c834d9c664aa675282f16a9e7a7b4c64fecc0fd855f')

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
