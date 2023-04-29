# Maintainer: Omar Pakker <archlinux@opakker.nl>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_basepkgname=libxkbfile
pkgname=lib32-${_basepkgname}
pkgver=1.1.2
pkgrel=1
pkgdesc="X11 keyboard file manipulation library"
arch=('x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('lib32-libx11')
makedepends=('xorg-util-macros')
source=(${url}/releases/individual/lib/${_basepkgname}-${pkgver}.tar.xz{,.sig})
sha512sums=('0639fad7b64b36a85f8d24cdd40085e0ec18d7a671793b8b5c26449e9cc5a84c37117e7757fb1238ac353044935dd00013e42166de5af9dec428e873a47e598d'
            'SKIP')
#validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') #Alan Coopersmith <alan.coopersmith@oracle.com>
validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A') # Matt Turner <mattst88@gmail.com>

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
