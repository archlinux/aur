# Maintainer: Omar Pakker <archlinux@opakker.nl>
# Contributor: Jan de Groot <jgc@archlinux.org>

_basepkgname=libxkbfile
pkgname=lib32-${_basepkgname}
pkgver=1.0.9
pkgrel=1
pkgdesc="X11 keyboard file manipulation library"
arch=('x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('lib32-libx11')
makedepends=('xorg-util-macros')
source=(${url}/releases/individual/lib/${_basepkgname}-${pkgver}.tar.bz2{,.sig})
sha256sums=('51817e0530961975d9513b773960b4edd275f7d5c72293d5a151ed4f42aeb16a' 'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') #Alan Coopersmith <alan.coopersmith@oracle.com>

build() {
	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
	
	cd "${srcdir}/${_basepkgname}-${pkgver}"
	./configure --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib32 --disable-static 
	make
}

package() {
	cd "${srcdir}/${_basepkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	rm -rf "${pkgdir}/usr/include"
	
	install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
