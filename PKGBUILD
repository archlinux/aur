# Maintainer: Allan McRae <allan@archlinux.org>

pkgname=debugedit
_srcname=rpm
pkgver=4.13.0rc1
_pkgver=4.13.0-rc1
pkgrel=1
pkgdesc="Tool to mangle source locations in .debug files"
arch=('x86_64')
url="http://www.rpm.org/"
license=('GPL')
depends=('glibc' 'libelf' 'nss' 'popt' 'zlib' )
source=("http://rpm.org/releases/testing/${_srcname}-${_pkgver}.tar.bz2")
sha1sums=('536fff19797e9fe49fd7f35ec0109356061bf033')

build() {
	cd "${_srcname}-${_pkgver}"
	
	CFLAGS+=" $(pkg-config --cflags nss)"
	./configure --prefix=/usr --with-external-db --without-lua
	make
}

package() {
	cd "${_srcname}-${_pkgver}"
	install -Dm755 .libs/debugedit "${pkgdir}/usr/bin/debugedit"
	install -Dm755 rpmio/.libs/librpmio.so.7.0.0 "${pkgdir}/usr/lib/librpmio.so.7.0.0"
	
	cd "${pkgdir}/usr/lib/"
	ln -s librpmio.so.7.0.0 librpmio.so.7
	ln -s librpmio.so.7.0.0 librpmio.so
}
