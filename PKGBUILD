# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname='nasc'
pkgver='0.4.7'
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
sha512sums=('b8e72b9b7c1c063862c48daf7e5f2d98f61cf4d479453225e407ee0848a1a7ab98feab142a92d876c4dfd3d28b4c8738a03f94cfded3c91b13c5f7585ed6814b')

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
	install -Dm755 libqalculatenasc/libqalculatenasc.so \
		"${pkgdir}/usr/lib/libqalculatenasc.so"
}
