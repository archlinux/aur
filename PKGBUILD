# Maintainer: Gicu GORODENCO <cyclopsihus 'at' gmail 'dot' com>

_pkgbasename=libart_lgpl
pkgname=lib32-libart-lgpl
pkgver=2.3.21
pkgrel=3
pkgdesc="A library for high-performance 2D graphics (lib32)"
url="http://www.levien.com/libart/"
arch=(x86_64)
license=('LGPL')
depends=('lib32-glibc')
makedepends=('pkgconfig' 'gcc-multilib')
source=(http://ftp.gnome.org/pub/GNOME/sources/${_pkgbasename}/2.3/${_pkgbasename}-${pkgver}.tar.bz2)
options=('!libtool')
sha256sums=('fdc11e74c10fc9ffe4188537e2b370c0abacca7d89021d4d303afdf7fd7476fa')

build() {
	cd "${srcdir}/${_pkgbasename}-${pkgver}"
	./configure --prefix=/usr --libdir=/usr/lib32 CC='gcc -m32' CXX='g++ -m32'
	make
}

package() {
	cd "${srcdir}/${_pkgbasename}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	# Cleanup for a lib32 package
	rm -rf ${pkgdir}/usr/{../etc,bin,include,share}
	# Install license
	install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

