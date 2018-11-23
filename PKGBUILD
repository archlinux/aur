# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=nasc
pkgver=0.5.1
pkgrel=1
pkgdesc='Do maths like a normal person.'
arch=('i686' 'x86_64')
url='https://parnold-x.github.io/nasc/'
license=('GPL3')
depends=('libqalculate' 'granite' 'libgee' 'gtksourceview3' 'libsoup')
optdepends=()
makedepends=('vala' 'git' 'cmake')
conflicts=('nasc-git' 'nasc-bzr')
source=("https://github.com/parnold-x/nasc/archive/${pkgver}.tar.gz")
sha512sums=('a49aefa40f3eb6581b0fddaf3726ae9070bf4e4f815c4dba07a5f12eed17db2f9c236a4337628a3844fb7d2fd3e876a5b1f790836e794c30b033c2962cdba46f')

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
