# Maintainer: zoe <chp321 AT gmail DOT com>
pkgname=mac-port
_shnver="s7"
pkgver=3.99.u4.b5.s7
pkgrel=7
pkgdesc="Monkey's Audio lossless audio codec - shntool patched"
arch=('i686' 'x86_64')
url="http://etree.org/shnutils/shntool/support/formats/ape/unix/"
license=('unknown')
depends=('gcc-libs') 
makedepends=('gcc' 'yasm')
optdepends=()
provides=('mac')
conflicts=('mac')
install='mac-port.install'
source=("http://www.etree.org/shnutils/shntool/support/formats/ape/unix/3.99-u4-b5-${_shnver}/mac-3.99-u4-b5-${_shnver}.tar.gz"
        'mac-port.install')
md5sums=('74df3c96476636387ddd12255b03bebe'
         '5a3e002cb925128f8c49738724c6233a')

build() { 
	cd ${srcdir}/mac-3.99-u4-b5-${_shnver}/
	CXXFLAGS="-DSHNTOOL" ./configure --prefix="/usr" --enable-assembly="yes" || return 1
	make || return 1
}

package() { 
	cd ${srcdir}/mac-3.99-u4-b5-${_shnver}/
	make DESTDIR=${pkgdir} install || return 1
}
