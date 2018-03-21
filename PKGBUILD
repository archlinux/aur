# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname='nasc'
pkgver='0.4.6'
pkgrel='1'
pkgdesc='Do maths like a normal person.'
arch=('i686' 'x86_64')
url='https://parnold-x.github.io/nasc/'
license=('GPL3')
depends=('libqalculate' 'granite' 'libgee' 'gtksourceview3' 'libsoup')
optdepends=()
makedepends=('vala' 'git' 'cmake')
conflicts=('nasc-git' 'nasc-bzr')
source=("https://github.com/parnold-x/nasc/archive/${pkgver}.tar.gz")
sha512sums=('b7c418a505ba81647009c1acf4db052807ed9ca53592bcca5cd730853ba588e1e20b2cd1012d3d484047a3d53e8f944dffdf26eadfa98b0495d2184f5ab9a7a9')

build () {
	cd "${pkgname}-${pkgver}"
	rm -rf build
	mkdir -p build
	cd build

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DGSETTINGS_COMPILE=OFF -DCMAKE_BUILD_TYPE=Release ..
	make
}

package () {
	cd "${pkgname}-${pkgver}/build"
	make install DESTDIR="${pkgdir}"
}
