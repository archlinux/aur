# Maintainer: masutu subric <masutu dot arch at googlemail dot com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Patrick Leslie Polzer <leslie.polzer@gmx.net>
pkgname=xmms-jack
pkgver=0.19
pkgrel=1
pkgdesc="JACK output plugin for XMMS"
arch=('i686' 'x86_64')
url="http://xmms-jack.sf.net/"
license=('GPL')
depends=('jack' 'xmms')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('3e3ed2e3ca4a4ca558b43e1b8e3a83d5')

build() {
	cd $srcdir/$pkgname
	./autogen.sh
	sed -i 's/jack_free/xmms_jack_free/g' jack.c
	sed -i 's/\/usr\/bin\/install/\/bin\/install/g' Makefile
	make
}

package() {
	cd $srcdir/$pkgname
	make DESTDIR=$pkgdir install
}
