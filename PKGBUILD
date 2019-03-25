# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=nasc
pkgver=0.5.2
pkgrel=1
pkgdesc='Do maths like a normal person.'
arch=('i686' 'x86_64')
url='https://parnold-x.github.io/nasc/'
license=('GPL3')
depends=('libqalculate' 'granite' 'libgee' 'gtksourceview3' 'libsoup' 'cln')
optdepends=()
makedepends=('vala' 'git' 'cmake')
conflicts=('nasc-git' 'nasc-bzr')
source=("https://github.com/parnold-x/nasc/archive/${pkgver}.tar.gz")
sha512sums=('b50e0d612144327198e841f76c1152879f91c70eae67c85e26fdd6839de1c4f26d1f4775158eade62a4a37f562b67c2f944e1feedfccf37324335aae3cf25eb3')

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
