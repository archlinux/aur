# Maintainer: Omar Pakker <archlinux@opakker.nl>
# Contributor: Jan de Groot <jgc@archlinux.org>

_basepkgname=libxkbfile
pkgname=lib32-${_basepkgname}
pkgver=1.1.0
pkgrel=1
pkgdesc="X11 keyboard file manipulation library"
arch=('x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('lib32-libx11')
makedepends=('xorg-util-macros')
source=(${url}/releases/individual/lib/${_basepkgname}-${pkgver}.tar.bz2{,.sig})
sha512sums=('1c6a57564e916ccdc3df3c49b9f3589f701df0cec55112c12ddc35ac3ed556608c28fe98e5ba0ac1962e9a65ed1e90eb7e6169b564951bf55a7cf3499b745826'
            'SKIP')
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
